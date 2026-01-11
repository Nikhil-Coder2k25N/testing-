import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends State<Notificationscreen> {

  String? message;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getToken();
  }

  void getToken() async{

    final FirebaseMessaging _messaging= FirebaseMessaging.instance;
    String? token= await _messaging.getToken();
    print("Token $token");


    FirebaseMessaging.onMessage.listen((RemoteMessage msg){

      print("meassge ${msg.notification?.title}");
      setState(() {
        message=msg.notification!.title;
      });
    });


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Text(message==null?"No Data":message!),
      ),

    );
  }
}