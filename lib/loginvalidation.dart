import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/registrationpage.dart';
import 'homepage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey=GlobalKey<FormState>();
  TextEditingController _name=TextEditingController();
  TextEditingController _email=TextEditingController();
  TextEditingController _number=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Login Page"),
                SizedBox(height: 100,),
                TextFormField(
                  controller:_email ,
                  validator: (value)
                  {
                    if(value==null ||value.isEmpty)
                    {
                      return "email is required";
                    }
                    else if(!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value))
                    {
                      return "wrong email address";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("Enter email"),
                      border: OutlineInputBorder(

                      )
                  ),
                ),
                const SizedBox(height: 10,),

                TextFormField(
                  validator: (value)
                  {
                    if(value==null ||value.isEmpty)
                    {
                      return "Password is required";
                    }
                    return null;
                  },
                  controller:_number ,
                  decoration: InputDecoration(
                      label: Text("Enter password"),
                      border: OutlineInputBorder(

                      )
                  ),
                ),

                SizedBox(height: 10,),

                ElevatedButton(onPressed: ()async{

                  print(_formKey.currentState!.validate());
                  if(_formKey.currentState!.validate())
                  {

                    UserCredential user =await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email.text, password:_number.text );
                    // login
                    print(user.user);
                    if(user.user!=null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Successful")));

                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Homepage()));

                    }
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Unsuccessful"),backgroundColor: Colors.red,));

                  }

                },style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder()), child: Text("Login"),),


                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Registerationpage()));

                }, child: Text("go to register"))
              ],
            ),
          ),
        )
    );
  }
}