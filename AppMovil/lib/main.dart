import 'package:flutter/material.dart';
import 'package:animio/app.dart';
import 'package:loggy/loggy.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // this is the key
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  runApp(App());
}