import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
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
}
