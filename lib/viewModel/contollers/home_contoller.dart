import 'dart:developer';

import 'package:assignment/data/model/place_info.dart';
import 'package:assignment/data/repo/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<PlaceInfo> places = <PlaceInfo>[].obs;
  RxBool isLoading = false.obs;
  Future<void> getPlaces() async {
    try {
      isLoading.value = true;
      final res = await HomeRepo().getAllPlaces();

      places.assignAll(res);
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPlaces();
  }
}
