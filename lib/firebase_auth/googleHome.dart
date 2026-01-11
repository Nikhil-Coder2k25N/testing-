import 'package:flutter/material.dart';
import 'firebase_auth.dart';
import 'googlelogin.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home page"),
        actions: [
          InkWell(
              onTap: () async {
                bool value=  await AuthService().signOut();

                if(value==true)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google logout")));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GoogleLoginPage()));
                }
              },
              child: Icon(Icons.login_outlined)),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Center(child: Text("Home Page")),
    );
  }
}