import 'dart:developer';
import 'package:assignment/core/services/home_service.dart';
import 'package:assignment/data/model/place_info.dart';

class HomeRepo {
  final HomeService _service = HomeService();

  Future<List<PlaceInfo>> getAllPlaces() async {
    try {
      final res = await _service.getAllPlaces(); // ✅ await here
      return res
          .map((e) => PlaceInfo.fromJson(e))
          .toList(); // ✅ convert each item
    } catch (e) {
      log("Error $e");
      rethrow;
    }
  }
}
