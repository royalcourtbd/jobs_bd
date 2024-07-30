import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jobs_bd/core/external_libs/splash/splash_screen.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:jobs_bd/firebase_options.dart';
import 'package:jobs_bd/presentation/jobs_bd.dart';

void main() async {
  await initializeApp();
  runApp(const JobsBd());
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _loadEnv();
  await _initializeFirebase();
  await _initializeAds();
  await _showSplashScreen();
}

Future<void> _loadEnv() async {
  try {
    await dotenv.load(fileName: '.env');
    debugPrint("Env file loaded successfully");
  } catch (e) {
    debugPrint("Error loading .env file: $e");
  }
}

Future<void> _initializeFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
    return true;
  };
}

Future<void> _initializeAds() async {
  await MobileAds.instance.initialize();
}

Future<void> _showSplashScreen() async {
  SplashScreen.show();
  await Future.delayed(const Duration(seconds: 3));
  SplashScreen.hide();
}
