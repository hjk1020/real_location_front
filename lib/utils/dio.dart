import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:real_app_2/bindings/login_binding.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/utils/app_apth.dart';

class DioHttp {
  // var baseurl = 'http://172.30.97.180:3000';

  static Dio exLoginDio = Dio(
      BaseOptions(baseUrl: 'http://172.30.97.180:3000', connectTimeout: 10000));

  // final dir = await getTemporaryDirectory();

  // String dir() async {
  //   final dir = await getTemporaryDirectory();
  //   //return DbCacheStore(databasePath: dir.path, logStatements: true);
  //   return dir.path;
  // }

  static final options = CacheOptions(
    store:
        DbCacheStore(databasePath: AppPathProvider.path, logStatements: true),
    policy: CachePolicy.forceCache,
    //priority: CachePriority.high,
    // maxStale: const Duration(minutes: 30),
    hitCacheOnErrorExcept: [],
    // allowPostMethod: true,
  );

  // static DioCacheManager dioCacheManager = DioCacheManager(CacheConfig(
  //     baseUrl: 'http://172.30.97.180:3000', maxMemoryCacheCount: 1000));

  Future defaultPostDioModel(String url, data) async {
    var res = await DioHttp.exLoginDio.post(url, data: data);
    if (res.statusCode == 200) {
      return res.data;
    }
  }

  Future defaultGetDioModel(String url) async {
    var res = await DioHttp.exLoginDio.get(url);
    if (res.statusCode == 200) {
      return res.data;
    }
  }

  Future getQueryDioModel(String url, Map<String, dynamic> data) async {
    var res = await DioHttp.exLoginDio.get(url, queryParameters: data);
    if (res.statusCode == 200) {
      return res.data;
    }
  }

  Future cacheDioModel() async {
    var dio = Dio(BaseOptions(baseUrl: 'http://172.30.97.180:3000'));

    dio.interceptors.add(DioCacheInterceptor(options: options));
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }

  Future<Dio> authDio() async {
    var dio = Dio(BaseOptions(baseUrl: 'http://172.30.97.180:3000'));

    final storage = new FlutterSecureStorage();

    dio.interceptors.clear();
    dio.interceptors.add(DioCacheInterceptor(options: options));

    //dio.interceptors.add(dioCacheManager.interceptor);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      // 기기에 저장된 AccessToken 로드
      final accessToken = await storage.read(key: 'accessToken');
      print(storage.read(key: 'accessToken'));
      // if (accessToken) {
      //   Get.offAll(() => const LoginMain(), binding: LoginBinding());
      // }

      // 매 요청마다 헤더에 AccessToken을 포함
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (error, handler) async {
      // 인증 오류가 발생했을 경우: AccessToken의 만료
      if (error.response?.statusCode == 401) {
        // 기기에 저장된 AccessToken과 RefreshToken 로드
        final accessToken = await storage.read(key: 'accessToken');
        final refreshToken = await storage.read(key: 'refreshToken');

        // 토큰 갱신 요청을 담당할 dio 객체 구현 후 그에 따른 interceptor 정의
        var refreshDio = Dio(BaseOptions(baseUrl: 'http://172.30.97.180:3000'));

        refreshDio.interceptors.clear();

        refreshDio.interceptors
            .add(InterceptorsWrapper(onError: (error, handler) async {
          // 다시 인증 오류가 발생했을 경우: RefreshToken의 만료
          if (error.response?.statusCode == 401) {
            // 기기의 자동 로그인 정보 삭제
            await storage.delete(key: 'accessToken');
            await storage.delete(key: 'refreshToken');

            // . . .
            // 로그인 만료 dialog 발생 후 로그인 페이지로 이동
            // . . .

            Get.offAll(() => const LoginMain(), binding: LoginBinding());
          }
          return handler.next(error);
        }));

        // 토큰 갱신 API 요청 시 AccessToken(만료), RefreshToken 포함
        refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
        refreshDio.options.headers['refresh'] = '$refreshToken';

        // 토큰 갱신 API 요청
        final refreshResponse = await refreshDio.get('/auth/refresh');

        final newAccessToken = refreshResponse.data['access_token'];
        final newRefreshToken = refreshResponse.data['refresh_token'];
        final newUsername = refreshResponse.data['username'];

        // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
        // final newAccessToken = refreshResponse.headers['Authorization']![0];
        // final newRefreshToken = refreshResponse.headers['Refresh']![0];

        // 기기에 저장된 AccessToken과 RefreshToken 갱신
        await storage.write(key: 'accessToken', value: newAccessToken);
        await storage.write(key: 'refreshToken', value: newRefreshToken);
        await storage.write(key: 'username', value: newUsername);

        // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';

        // 수행하지 못했던 API 요청 복사본 생성
        final clonedRequest = await dio.request(error.requestOptions.path,
            options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers),
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters);

        // API 복사본으로 재요청
        return handler.resolve(clonedRequest);
      }
      Get.offAll(() => const LoginMain(), binding: LoginBinding());

      // return handler.next(error);
    }));

    return dio;
  }
}
