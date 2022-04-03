import 'package:get/get.dart';
import 'package:sj_center/controller/carousel_controller.dart';

import '../controller/about_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutController());
    Get.put(CarouselController());
  }
}
