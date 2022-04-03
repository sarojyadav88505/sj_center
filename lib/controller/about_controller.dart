import 'package:get/get.dart';

import '../model/about_model.dart';
import '../service/remote_service.dart';

class AboutController extends GetxController {
  var about = AboutModel(data: []).obs;
  var isLoading = true.obs;
  Future getAbout() async {
    try {
      isLoading(true);
      var response = await RemoteService.fetchAbout();
      if (response != null) {
        about.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getAbout();
    super.onInit();
  }
}
