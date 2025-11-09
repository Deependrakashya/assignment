import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class HomeService {
  Future<List<dynamic>> getAllPlaces() async {
    final url = Uri.parse(
      "https://6847d529ec44b9f3493e5f06.mockapi.io/api/v1/events",
    );
    try {
      final res = await http.get(url);
      if (res.statusCode == 200) {
        return jsonDecode(res.body) as List<dynamic>; // ✅ return list
      } else {
        throw Exception('Failed to load places: ${res.statusCode}');
      }
    } catch (e) {
      log("Error $e");
      rethrow;
    }
  }
}
