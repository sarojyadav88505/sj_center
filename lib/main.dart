import 'package:flutter/material.dart';
import 'package:sj_center/util/app_color.dart';
import 'package:sj_center/view/Screens/dashboard.dart';
import 'package:get/get.dart';
import 'binding/controller_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sj 💻 center',
      theme: ThemeData(
        primaryColor: AppColor.ancentColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: AppColor.primaryColor,
          // backgroundColor: AppColor.ancentColor,
          elevation: .5,
          iconTheme: IconTheme.of(context).copyWith(color: AppColor.textColor),
          titleTextStyle: const TextStyle(
              color: AppColor.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600),
          centerTitle: false,
        ),
        drawerTheme: DrawerTheme.of(context)
            .copyWith(backgroundColor: AppColor.textColor),
      ),
      // initialRoute: '/',
      // routes: {
      //   "/": (context) => const Dashboard(),
      // },//without getx use na garikana name route yasari banauney
      home: const Dashboard(),
      initialBinding: ControllerBinding(),

      // initialRoute: "/",
      // defaultTransition: Transition.native,
      // getPages: [
      //   GetPage(name: "/", page: () => const Dashboard()),
      // ],
    );
  }
}
