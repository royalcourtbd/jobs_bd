import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jobs_bd/firebase_options.dart';
import 'package:jobs_bd/presentation/jobs_bd.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await initial();
  runApp(const JobsBd());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
