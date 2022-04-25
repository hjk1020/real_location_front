// import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
//import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:real_app_2/models/room_list_items.dart';
import 'package:real_app_2/pages/login/login_main/login_main.dart';
import 'package:real_app_2/utils/api_helper_auth.dart';
import 'package:real_app_2/utils/dio.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  ScrollController scrollController = ScrollController();
  // final RefreshController refreshController = RefreshController();
  // final PagingController pagingController = PagingController(firstPageKey: 1);

  RxBool isLoading = false.obs;
  RxInt mainPage = 1.obs;
  RxBool lastPage = false.obs;

  //var testList = [].obs;

  var defaultRoomList = <RoomListItems>[].obs;

  @override
  void onInit() async {
    // pagingController.addPageRequestListener((pageKey) {
    //   roomListHttp(mainPage.value, false);
    // });
    await roomListHttp(mainPage.value, CachePolicy.request);
    tokenPass();
    _paging();

    //나중에 캐시로 바꾸기

    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void tokenPass() async {
    final storage = new FlutterSecureStorage();
    final access = await storage.read(key: 'accessToken');
    if (access == null) {
      Get.offAll(() => const LoginMain());
    }
  }

  void _paging() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          lastPage.value == false) {
        roomListHttp(mainPage.value, CachePolicy.request);
      }
    });
  }

  Future refresh() async {
    mainPage.value = 1;
    lastPage.value = false;
    defaultRoomList.clear();
    //  DioHttp.dioCacheManager.clearAll();

    await roomListHttp(mainPage.value, CachePolicy.refresh);
  }

  // void onRefresh() async {
  //   mainPage.value = 1;
  //   lastPage.value = false;
  //   defaultRoomList.clear();
  //   await roomListHttp(mainPage.value, true);
  //   refreshController.refreshCompleted();
  // }

  // void onLoading() async {
  //   if (lastPage.value == false) {
  //     await roomListHttp(mainPage.value, false);
  //     refreshController.loadComplete();
  //   } else {
  //     refreshController.loadNoData();
  //   }
  // }

  Future roomListHttp(int page, CachePolicy policy) async {
    isLoading(true);
    // var dio = await DioHttp().authDio();

    // var res = await dio.get(
    //   '/room/default_room_list',
    //   queryParameters: {'page': page},
    //   //options: buildCacheOptions(Duration(seconds: 300), forceRefresh: true),
    // );
    var res = await ApiHelperAuth.instance.get('/room/default_room_list',
        queryParameters: {'page': page},
        options: ApiHelperAuth.options.copyWith(policy: policy).toOptions());

    if (res['code'] == 1) {
      List list = res['responseData'];
      final isLastPage = list.length < 20;
      if (isLastPage) {
        lastPage.value = true;
        // pagingController.appendLastPage(list);
      } else {
        mainPage.value++;
        // final nextPageKey = page + 1;
        // pagingController.appendPage(list, nextPageKey);
      }

      var map =
          list.map<RoomListItems>((e) => RoomListItems.fromJson(e)).toList();
      defaultRoomList.addAll(map);
      // print(map);
      // print(defaultRoomList.value[0].locationTitle);
      // print(res.data['code']);
      //print(res.data['code']);
      //print(mainPage.value);
      isLoading(false);
      return;
    }
    isLoading(false);
    return;
  }
}
