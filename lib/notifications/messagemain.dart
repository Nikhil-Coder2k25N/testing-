
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/notifications/notification.dart';
import '../firebase_options.dart';

Future<void>_firebaseMessagingBackgroundHandler( RemoteMessage mes)async {
  await Firebase.initializeApp();
  print("Message in main ${mes.data}");
}

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Notificationscreen(),
      ));
}