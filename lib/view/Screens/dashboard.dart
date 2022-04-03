import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sj_center/view/widgets/drawer.dart';

import '../../util/app_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2), (() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            ColorizeAnimatedText(
              'Sj💻Center',
              textStyle: TextAnimation.colorizeTextStyle,
              colors: Textcolors.colorizeColors,
            ),
          ],
          isRepeatingAnimation: true,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.circle_notifications,
                size: 40,
              ),
            ),
          )
        ],
      ),
      drawer: myDrawer(context),
    );
  }
}
