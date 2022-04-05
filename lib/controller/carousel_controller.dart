import 'package:get/get.dart';
import 'package:sj_center/model/carousel_model.dart';

import '../service/remote_service.dart';

class CarouselController extends GetxController {
  var carousel = <CarouselModel>[].obs;
  var isLoading = true.obs;

  Future getCarousel() async {
    try {
      isLoading(true);
      var response = await RemoteService.fetchCarousel();
      if (response != null) {
        carousel.value = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCarousel();
    super.onInit();
  }
}
