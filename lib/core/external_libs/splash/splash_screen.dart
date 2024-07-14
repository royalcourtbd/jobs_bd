import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:jobs_bd/presentation/home/presenter/home_presenter.dart';
import 'package:jobs_bd/presentation/splash_screen/presenter/splash_screen_presenter.dart';

// makes sure that the splash screen is not shown when app opened from
// minimized state
bool _appAlreadyOpen = false;

/// Utility class for showing and hiding the splash screen in the app.
///
/// This class provides methods to show and hide the splash screen, along with
/// helper methods to toggle the system UI mode and status bar style to provide
/// a seamless transition between the splash screen and the app's main UI.
///
/// Uses the 'FlutterNativeSplash' package to create and manage the
/// splash screen.
/// The package provides native implementations for showing and
/// hiding the splash screen on Android and iOS platforms.
class SplashScreen {
  SplashScreen._();

  static Future<void> show() async {
    if (_appAlreadyOpen) return;
    final HomePresenter homePresenter = Get.put(HomePresenter());
    final SplashScreenPresenter sController = Get.put(SplashScreenPresenter());
    final WidgetsBinding widgetsBinding =
        WidgetsFlutterBinding.ensureInitialized();
    _toggleStatusBarFullScreen();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    _appAlreadyOpen = true;
  }

  static Future<void> hide({BuildContext? context}) async {
    _toggleStatusBarFullScreen(makeFullScreen: false, context: context);

    FlutterNativeSplash.remove();
  }

  static void _toggleStatusBarFullScreen({
    bool makeFullScreen = true,
    BuildContext? context,
  }) {
    const SystemUiMode uiMode = SystemUiMode.manual;
    final List<SystemUiOverlay> overlays =
        makeFullScreen ? [] : SystemUiOverlay.values;
    SystemChrome.setEnabledSystemUIMode(uiMode, overlays: overlays);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    if (makeFullScreen) return;
  }
}
