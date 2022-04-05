import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sj_center/view/widgets/carousel.dart';
import 'package:sj_center/view/widgets/drawer.dart';

import '../../util/app_color.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Future refresh() async {
    await Future.delayed(const Duration(seconds: 2), (() {
      carousel(context);
    }));
  }

  @override
  Widget build(BuildContext context) {
    DateTime? lastPressed;
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
      body: RefreshIndicator(
        onRefresh: refresh,
        child: WillPopScope(
          onWillPop: () async {
            final now = DateTime.now();
            // ignore: prefer_const_declarations
            final maxDuration = const Duration(seconds: 2);
            final isWarning = lastPressed == null ||
                now.difference(lastPressed!) > maxDuration;
            if (isWarning) {
              lastPressed = DateTime.now();

              final snackBar = SnackBar(
                content: const Text('Double Tap To Close App'),
                duration: maxDuration,
              );

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(snackBar);
              return false;
            } else {
              return true;
            }
          },
          // Code end Here of DOuble tap
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Slider Component
                carousel(context),

                // Course Type Components
              ],
            ),
          ),
        ),
      ),
    );
  }
}
