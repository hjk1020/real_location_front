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
      final accessToken = await storage.read(key: 'accessToken');
      print(storage.read(key: 'accessToken'));
      // if (accessToken) {
      //   Get.offAll(() => const LoginMain(), binding: LoginBinding());
      // }

      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (error, handler) async {
      if (error.response?.statusCode == 401) {
        // 기기에 저장된 AccessToken과 RefreshToken 로드
        final accessToken = await storage.read(key: 'accessToken');
        final refreshToken = await storage.read(key: 'refreshToken');

        var refreshDio = Dio(BaseOptions(baseUrl: 'http://172.30.97.180:3000'));

        refreshDio.interceptors.clear();

        refreshDio.interceptors
            .add(InterceptorsWrapper(onError: (error, handler) async {
          if (error.response?.statusCode == 401 &&
              error.response?.statusCode == 403) {
            await storage.delete(key: 'accessToken');
            await storage.delete(key: 'refreshToken');

         

            Get.offAll(() => const LoginMain(), binding: LoginBinding());
          }
          return handler.next(error);
        }));

        refreshDio.options.headers['Authorization'] = 'Bearer $accessToken';
        refreshDio.options.headers['refresh'] = '$refreshToken';

        final refreshResponse = await refreshDio.get('/auth/refresh');

        final newAccessToken = refreshResponse.data['access_token'];
        final newRefreshToken = refreshResponse.data['refresh_token'];



        await storage.write(key: 'accessToken', value: newAccessToken);
        await storage.write(key: 'refreshToken', value: newRefreshToken);

        error.requestOptions.headers['Authorization'] =
            'Bearer $newAccessToken';

        final clonedRequest = await _dio.request(error.requestOptions.path,
            options: Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers),
            data: error.requestOptions.data,
            queryParameters: error.requestOptions.queryParameters);

        return handler.resolve(clonedRequest);
      } else if (error.response?.statusCode == 403) {
        Get.offAll(() => const LoginMain(), binding: LoginBinding());
      }
      return handler.next(error);
    }));


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
