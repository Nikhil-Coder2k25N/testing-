import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginvalidation.dart';
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_outlined,size: 100,color: Colors.green,),
            Text("Home",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize:24),),
            TextField(
              decoration: InputDecoration(
                label: Text("Enter Name"),
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut().then((value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
              });
            }, child: Text("Logout")),

            ElevatedButton(onPressed: ()async{
              storeData();
            }, child: Text("Store Data in Local Database")),
          ],
        ),
      ),
    );
  }
}
