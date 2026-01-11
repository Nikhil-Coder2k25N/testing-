import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myfirstclass/API/loginvalidation.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: APILogin(),
  ));
}

/* 5 Types of Restful API
POST,GET,PUT,DELETE,PATCH */

/* Home Work----->>
Reg Page--
 name,email,phone,password,password_confirmation
login Page--
email,password
*/
