import 'package:flutter/material.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person_outlined,size: 100,color: Colors.blue,),
            Text("Profile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
