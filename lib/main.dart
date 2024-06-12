import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jobs_bd/core/external_libs/splash/splash_screen.dart';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:jobs_bd/firebase_options.dart';
import 'package:jobs_bd/presentation/jobs_bd.dart';

void main() async {
  await initial();
  runApp(const JobsBd());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    return true;
  };

  // await FirebaseMessagingRepository().initNotification();
  await MobileAds.instance.initialize();
  SplashScreen.show();
  await Future.delayed(const Duration(seconds: 3));
  SplashScreen.hide();
}
