import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../loginvalidation.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _name=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _number=TextEditingController();
  final FirebaseFirestore _database=FirebaseFirestore.instance;
  Future<void> _uploaddate() async {
    Map<String,dynamic> user={
      "name":_name.text,
      "email":_email.text,
      "number":_number.text
    };
    _database.collection("UserData").add(user).then((value){
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Uploaded")));
    });
  }


  final   TextEditingController name=TextEditingController();
  Future<void> storeData()
  async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setInt("number", 1);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Stored")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _name,
              decoration: InputDecoration(
                  label: Text("Enter Name"),
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _email,
              decoration: InputDecoration(
                  label: Text("Enter Email id"),
                  border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _number,
              decoration: InputDecoration(
                  label: Text("Enter Number"),
                  border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: _uploaddate, child: Text("Upload Data"),)
          ],
        ),
      )
    );
  }
}
