import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/storedeletedata/productlisting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _HomepageState();
}

class _HomepageState extends State<Store> {

  final TextEditingController _name=TextEditingController();
  final TextEditingController _email=TextEditingController();
  final TextEditingController _number=TextEditingController();
  final FirebaseFirestore _database=FirebaseFirestore.instance;
  User? user;
  Map<String,dynamic>userfetch ={};

  Future<void> _uploaddate() async
  {
    //insert data into firebase database logic
    User? userlogin = FirebaseAuth.instance.currentUser;

    Map<String,dynamic> userdata={
      "name":_name.text,
      "email":_email.text,
      "number":_number.text
    };
    // _database.collection("UserData").doc().add(user).then((value){
    //   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Uploaded")));
    // });
    try {
      _database.collection("UserData").add(userdata);

      _name.clear();
      _email.clear();
      _number.clear();
    }
    catch(e){

    }

    // catch(e)
    // {
    //   print(e.toString());
    // }
  }

  Future<void>_fetchdata()async{
    DocumentSnapshot snapshot =await _database.collection("UserData").doc(user!.uid).get();
    userfetch =snapshot.data() as Map<String,dynamic>;
    print('mydata ${snapshot.data()}');
    print('data${snapshot.get("name")}');
  }


  final   TextEditingController name=TextEditingController();

  Future<void> storeData()
  async {
    final SharedPreferences pref= await SharedPreferences.getInstance();
    pref.setInt("number", 1);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data Stored")));
  }

  // Future<void> fetch()
  // async{
  //   DocumentSnapshot snapshot = await _database.collection("UserData").doc(user!.uid).get();
  //   userfetch = snapshot.data() as Map<String,dynamic>;
  //   print('My info${userfetch.data}');
  //   userfetch['name'];
  //   print('mydata ${snapshot.data()}');
  //   print("data ${snapshot.get("name")}");
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      FirebaseAuth.instance.currentUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text("Store Data",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        actions: [
          InkWell(
            onTap: _uploaddate,
              //onTap: () async {

                // bool value=  await AuthService.signOut();
                //
                // if(value==true)
                // {
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Google logout")));
                //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homework()));
                // }
              //},
              child: Icon(Icons.login_outlined)),
          SizedBox(width: 20),
        ],
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _name,
                decoration: InputDecoration(
                    hintText: "Enter name ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                controller: _email,
                decoration: InputDecoration(
                    hintText: "Enter email ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
              SizedBox(height: 30,),

              TextField(
                controller: _number,
                decoration: InputDecoration(
                    hintText: "Enter number ",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    )
                ),
              ),
              SizedBox(height: 30,),

              ElevatedButton(onPressed: _uploaddate, child: Text("Upload")),

              SizedBox(height: 30,),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductListing()));
                },
                  child: Text("ShowData")),
            ],
          ),
        ),
      ),
    );
  }
}