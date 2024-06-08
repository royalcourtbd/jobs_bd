import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/core/external_libs/presentable_widget_builder.dart';
import 'package:jobs_bd/presentation/home/ui/home_page.dart';
import 'package:jobs_bd/presentation/splash_screen/presenter/splash_screen_presenter.dart';
import 'package:jobs_bd/presentation/splash_screen/ui/splash_screen%20copy.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashScreenPresenter sController = Get.put(SplashScreenPresenter());

  @override
  Widget build(BuildContext context) {
    return PresentableWidgetBuilder(
      presenter: sController,
      builder: () {
        return Scaffold(
          body: Center(
            child: sController.currentUiState.isInternetConnected
                ? HomePage()
                : NOState(),
          ),
        );
      },
    );
  }
}
