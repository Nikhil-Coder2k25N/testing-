import 'package:flutter/material.dart';
import 'googleHome.dart';
import 'firebase_auth.dart';

class GoogleLoginPage extends StatefulWidget {
  const GoogleLoginPage({super.key});

  @override
  State<GoogleLoginPage> createState() => _GoogleLoginPageState();
}

class _GoogleLoginPageState extends State<GoogleLoginPage> {
  bool _loading=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  _loading=false;
                });
                final user = await AuthService().signInWithGoogle();
                if (user != null) {
                  setState(() {
                    _loading=true;
                  });
                  print("User data $user");
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
                } else {
                  print("Login Failed");
                }
              },
              child: const Text("Sign in with Google"),
            ),

            SizedBox(
              height: 20,
            ),

            if(_loading==false)
              CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}