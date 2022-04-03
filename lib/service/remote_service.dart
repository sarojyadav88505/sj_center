import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sj_center/model/carousel_model.dart';

import '../model/about_model.dart';

class RemoteService {
  static var client = http.Client();
  static String baseURL = "https://carelesscoder.com/api";

  // Fetch About us

  static Future<AboutModel?> fetchAbout() async {
    try {
      var response = await client.get(Uri.parse("$baseURL/about"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return aboutModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return null;
  }

  // fetch carousel/slides
  static Future<List<CarouselModel>?> fetchCarousel() async {
    try {
      var response = await client.get(Uri.parse("$baseURL/slide"));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return carouselModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    return null;
  }
}
