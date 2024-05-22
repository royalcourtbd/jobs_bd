import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/bindings/allbindings.dart';
import 'package:jobs_bd/core/config/themes.dart';
import 'package:jobs_bd/presentation/home/ui/home_page.dart';

class JobsBd extends StatelessWidget {
  const JobsBd({super.key});
  static final GlobalKey _globalKey = GlobalKey();
  static BuildContext get globalContext =>
      Get.context ?? _globalKey.currentContext!;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      theme: TutorTheme.lightTheme,
      title: 'Jobs BD',
      home: const HomePage(),
    );
  }
}
