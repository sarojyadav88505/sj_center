import 'dart:html';

import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sj_center/controller/carousel_controller.dart';

Widget carousel(BuildContext context) {
  var carouselController = Get.find<CarouselController>();
  return Obx(() {
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
                Image.network(),
                Image.network(),
                Image.network(),
                Image.network(),
                Image.network(),
              ],
            ),
          );
  });
}
