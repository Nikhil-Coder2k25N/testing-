import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'bottomnavigation.dart';
class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  String? _selectedRole ;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child:SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60,),
                    Image.asset('Assets/images/logo.png',height:110,width: 100,),
                    SizedBox(height: 8,),
                    Text("The Bhopal School of Social Sciences  ",style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 18,color:Colors.deepPurple),),
                    SizedBox(height: 2,),
                    Text("Faculty & Admin Portal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color:Colors.black54),),
                    SizedBox(height: 11,),
                    Container(
                      height: 390,
                      width: 325,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(9.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: Colors.indigo,
                                    value: 'Administrator',
                                    title: Text("Admin", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                                    groupValue: _selectedRole,
                                    onChanged: (String? value){
                                      setState(() {
                                        _selectedRole =value;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile(
                                    activeColor: Colors.indigo,
                                    value: 'Faculty',
                                    title: Text("Faculty", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                    groupValue: _selectedRole,
                                    onChanged: (String? value){
                                      setState(() {
                                        _selectedRole =value;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                else if(!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value))
                                {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(onPressed: (){print("new user");}, child: Text("New User? Signup",style: TextStyle(color: Colors.black,fontSize: 14,decoration:TextDecoration.underline,decorationStyle:TextDecorationStyle.dashed,),)),
                            ],
                          ),
                          SizedBox(height: 0),
                          ElevatedButton(
                            onPressed: () async{
                              print(_formKey.currentState!.validate());
                              if (_formKey.currentState!.validate()) {
                                UserCredential user =await FirebaseAuth.instance.signInWithEmailAndPassword(email:emailController.text, password:passwordController.text );
                                // Perform login action
                                print('Email: ${emailController.text}');
                                print('Password: ${passwordController.text}');
                                print('Role: $_selectedRole');
                                print(user.user);
                                if(user.user!=null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Login Successful")));
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
                                }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Unsuccessful"),backgroundColor: Colors.red,));
                              }
                            },
                            child: Text('Login'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Support Contact",style: GoogleFonts.lato(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 12,decoration: TextDecoration.underline,decorationThickness: 1.2,height: 0.01)),
                    TextButton(onPressed:() { print("Support");}, child: Text("BSSS Technical Team !",style: GoogleFonts.afacad(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15,fontStyle: FontStyle.italic,height: 1.0),)
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
