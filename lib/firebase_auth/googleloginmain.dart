import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'googlelogin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: GoogleLoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
