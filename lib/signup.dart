import 'package:flutter/material.dart';
class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text("REGISTRATION PAGE",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/logo.png',height:120),

              TextField(
                decoration: InputDecoration(
                    hintText: "Enter UserName",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))

                    )
                ),
              ),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                              bottomLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0))

                      )
                  )
              ),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))


                      )
                  )
              ),
              SizedBox(height: 20),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0))

                      )
                  )
              ),
              SizedBox(height: 20,),
              Text("Already Have Account ?",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  //  ElevatedButton(onPressed: (){"Login Button Click";}, child:Text("Login")),
                    ElevatedButton(onPressed: (){ "Button Pressed";}, child: Text("Create Profile"),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white)
                    ),

                  ]
              )

            ],
          ),
        ),
      ),
    );
  }
}