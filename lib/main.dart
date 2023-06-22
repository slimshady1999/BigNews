import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'intro_Screen/splashPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      const MaterialApp(debugShowCheckedModeBanner: false, home: SplashPage()));
}
