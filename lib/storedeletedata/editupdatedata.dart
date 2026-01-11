import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../firebase_auth/firebase_auth.dart';
import '../firebase_auth/googlelogin.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _HomeState();
}
class _HomeState extends State<Home1> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _number = TextEditingController();
  final FirebaseFirestore _database = FirebaseFirestore.instance;
  User? user;
  Map<String, dynamic> userfetch = {};

  Future<void> _uploaddata() async {
    if (user == null) {
      return;
    }

    Map<String, dynamic> userData = {
      "name": _name.text,
      "email": _email.text,
      "number": _number.text,
    };
    try {
      _database.collection("UserData").doc(user?.uid).set(userData);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Data stored")));

      _name.clear();
      _email.clear();
      _number.clear();
    } catch (e) {}
  }
  Future<void> _fetchdata() async {
    DocumentSnapshot snapshot = await _database
        .collection("UserData")
        .doc(user!.uid)
        .get();
    userfetch = snapshot.data() as Map<String, dynamic>;
    print('mydata ${snapshot.data()}');
    print("Data ${snapshot.get("name")}");
    _name.text = snapshot.get("name");
    _email.text = snapshot.get("email");
    _number.text = snapshot.get("number");
  }
  @override
  void initState() {
    super.initState();

    setState(() {
      user = FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Home page"),
        actions: [
          InkWell(
            onTap: () async {
              bool value = await AuthService().signOut();

              if (value == true) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Google logout")));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GoogleLoginPage()),
                );
              }
            },
            child: Icon(Icons.login_outlined),
          ),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.grey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(

                  controller: _name,
                  decoration: InputDecoration(
                    hintText: "Enter name ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  readOnly: true,
                  controller: _email,
                  decoration: InputDecoration(
                    hintText: "Enter email ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                TextField(
                  controller: _number,
                  decoration: InputDecoration(
                    hintText: "Enter number ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                ElevatedButton(onPressed: _uploaddata, child: Text("Upload")),

                SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {

                    if(user!=null && _number.text.isNotEmpty) {
                      _database.collection("UserData").doc(user!.uid).update(
                          <String, dynamic>{"number": _number.text}
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please login first")));


                  },
                  child: Text("update"),
                ),
                SizedBox(height: 30),
                ElevatedButton(onPressed: _fetchdata, child: Text("ShowData")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}