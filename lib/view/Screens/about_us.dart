import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sj_center/view/widgets/buttons.dart';
import 'package:get/get.dart';

import '../../controller/about_controller.dart';
import '../../util/app_color.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var aboutController = Get.find<AboutController>();
    return Scaffold(
      body: Obx(
        (() {
          return aboutController.isLoading.value == true
              ? const CircularProgressIndicator.adaptive()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: aboutController.about.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = aboutController.about.value.data[index];
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 300,
                            // width: 400,
                            width: MediaQuery.of(context).size.width,
                            child: Image.network(
                              mydata.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          DefaultTextStyle(
                            style: const TextStyle(
                                fontSize: 28.0, color: Colors.black),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                WavyAnimatedText('Contact Developer!'),
                              ],
                              isRepeatingAnimation: true,
                              onTap: () {},
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Name: ' + mydata.name + '\n',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColor.primaryColor),
                                ),
                                TextSpan(
                                  text: 'Contact: +977-' + mydata.phone + '\n',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColor.primaryColor),
                                ),
                                TextSpan(
                                  text: 'Location: ' + mydata.location + '\n',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Follow us on Social Media.',
                            style: TextStyle(
                                fontSize: 28, color: AppColor.ancentColor),
                          ),
                          myButtons(),
                        ],
                      ),
                    );
                  },
                );
        }),
      ),
    );
  }
}
