import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/loginvalidation.dart';

import 'homepage.dart';

class Registerationpage extends StatefulWidget {
  const Registerationpage({super.key});

  @override
  State<Registerationpage> createState() => _RegisterationpageState();
}

class _RegisterationpageState extends State<Registerationpage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Registration Page"),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email is required";
                  } else if (!RegExp(
                    r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$',
                  ).hasMatch(value)) {
                    return "wrong email address";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: Text("Enter email"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                controller: _password,
                decoration: InputDecoration(
                  label: Text("Enter password"),
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () async {
                  print(_formKey.currentState!.validate());
                  if (_formKey.currentState!.validate()) {
                    try{
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _email.text,
                        password: _password.text,
                      )
                          .then((value) {
                        print("data $value");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Registration Successful")),
                        );
                      });

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));

                    }
                    catch (e){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Registration Unsuccessful $e"),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    // login
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Registration Unsuccessful"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                ),
                child: Text("Register"),
              ),

              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));

              }, child: Text("go to login"))

            ],
          ),
        ),
      ),
    );
  }
}