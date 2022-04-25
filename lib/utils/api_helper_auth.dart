import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_db_store/dio_cache_interceptor_db_store.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import '../bindings/login_binding.dart';
import '../pages/login/login_main/login_main.dart';
import 'app_apth.dart';

class ApiHelperAuth {
  ApiHelperAuth._() {
    _init(); //initiallze offline cache
  }
  final storage = new FlutterSecureStorage();

  final Dio _dio = Dio(
    BaseOptions(baseUrl: 'http://192.168.35.103:3000', connectTimeout: 10000
        // headers: {
        //   HttpHeaders.contentTypeHeader: 'application/json',
        //   HttpHeaders.acceptHeader: 'application/json',
        // },
        ),
  );

  static final ApiHelperAuth _instance = ApiHelperAuth._();
  static ApiHelperAuth get instance => _instance;

   static final options = CacheOptions(
    store:
        DbCacheStore(databasePath: AppPathProvider.path, logStatements: true),
    policy: CachePolicy.refreshForceCache,
    hitCacheOnErrorExcept: [],
    maxStale: const Duration(minutes: 30),
    //increase number of days for loger cache
    priority: CachePriority.high,
  );

  void _init() {
    _dio.interceptors.add(
      DioCacheInterceptor(
        options: options
      ),
    );
    _dio.interceptors.add(LogInterceptor(responseBody: true));
    _dio.interceptors
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
          if (error.response?.statusCode == 401 &&
              error.response?.statusCode == 403) {
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
        // final newUsername = refreshResponse.data['username'];

        // response로부터 새로 갱신된 AccessToken과 RefreshToken 파싱
        // final newAccessToken = refreshResponse.headers['Authorization']![0];
        // final newRefreshToken = refreshResponse.headers['Refresh']![0];

        // 기기에 저장된 AccessToken과 RefreshToken 갱신
        await storage.write(key: 'accessToken', value: newAccessToken);
        await storage.write(key: 'refreshToken', value: newRefreshToken);
        // await storage.write(key: 'username', value: newUsername);

        // AccessToken의 만료로 수행하지 못했던 API 요청에 담겼던 AccessToken 갱신
        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';

        // 수행하지 못했던 API 요청 복사본 생성
        final clonedRequest = await _dio.request(error.requestOptions.path,
            options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers),
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters);

        // API 복사본으로 재요청
        return handler.resolve(clonedRequest);
      } else if (error.response?.statusCode == 403) {
        Get.offAll(() => const LoginMain(), binding: LoginBinding());
      }
      return handler.next(error);
    }));

    //this is for avoiding certificates error cause by dio
    //https://issueexplorer.com/issue/flutterchina/dio/1285

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}
