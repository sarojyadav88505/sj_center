import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../util/app_color.dart';
import '../Screens/about_us.dart';

void _launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}

Widget myDrawer(BuildContext context) {
  return SafeArea(
    child: Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            // decoration: BoxDecoration(color: Colors.grey[100]),
            currentAccountPicture: CircleAvatar(
              child: Image(
                image: AssetImage(
                  'assets/drawerlogo.png',
                ),
              ),
              backgroundColor: Colors.orangeAccent,
            ),
            accountName: Text(
              "SJ Computer Center",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor
                  // fontFamily:
                  ),
            ),
            accountEmail: Text(
              "Perfect for IT World",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryColor
                  // fontFamily:
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pop(context);
            },
            // ignore: prefer_const_constructors
            leading: Icon(
              Icons.space_dashboard_rounded,
              color: AppColor.primaryColor,
            ),
            title: const Text("Dashboard"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.document_scanner_outlined,
              color: AppColor.primaryColor,
            ),
            title: const Text("Verify Your Certificate"),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.download,
              color: AppColor.primaryColor,
            ),
            title: const Text("Download"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              _launchURL("https://www.facebook.com/vipcoding/");
              // print('Saroj');
            },
            leading: const Icon(
              Icons.facebook_sharp,
              color: AppColor.primaryColor,
            ),
            title: const Text("Facebook Page"),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              _launchURL("https://forms.gle/fH3zF3PZQ3fDth6y7");
              // print('Saroj');
            },
            leading: const Icon(
              Icons.feedback_rounded,
              color: Colors.red,
            ),
            title: const Text("Feedback"),
          ),
          ListTile(
            title: const Text("About us"),
            onTap: () {
              Get.to(() => const AboutPage());
            },
            leading: const Icon(Icons.info_outline),
          ),
          const Divider(),
          const ListTile(
            leading: Text(
              "v",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: Colors.blueGrey),
            ),
            title: Text("Version"),
            subtitle: Text("1.0.0"),
          ),
          const Divider(),
          ListTile(
            title: const Text("Exit"),
            onTap: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              }
            },
            leading: const Icon(
              Icons.logout,
              color: AppColor.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
