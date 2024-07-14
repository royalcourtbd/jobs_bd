import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/static/svg_path.dart';
import 'package:jobs_bd/presentation/splash_screen/presenter/splash_screen_presenter.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({super.key});
  final SplashScreenPresenter controller = Get.put(SplashScreenPresenter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(SvgPath.imgNoInternet),
      ],
    ));
  }
}
