import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'phone_number.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhoneNumber(),
  ));
}
