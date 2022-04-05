import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sj_center/controller/carousel_controller.dart';

Widget carousel(BuildContext context) {
  var carouselController = Get.find<CarouselController>();
  return Obx(() {
    // ignore: invalid_use_of_protected_member
    var mydata = carouselController.carousel.value[0];
    return carouselController.isLoading.value == true
        ? const CircularProgressIndicator.adaptive()
        : SizedBox(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Carousel(
              dotBgColor: Colors.transparent,
              dotPosition: DotPosition.bottomLeft,
              dotSize: 0.5,
              dotSpacing: 10,
              animationDuration: const Duration(seconds: 1),
              images: [
                Image.network(mydata.image),
                Image.network(mydata.image[1]),
                Image.network(mydata.image[2]),
                Image.network(mydata.image[3]),
                Image.network(mydata.image[4]),
              ],
            ),
          );
  });
}
