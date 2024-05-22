import 'package:flutter/material.dart';
import 'package:jobs_bd/presentation/jobs_bd.dart';

void main() async {
  await initial();
  runApp(const JobsBd());
}

initial() async {
  WidgetsFlutterBinding.ensureInitialized();
}
