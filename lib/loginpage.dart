import 'package:flutter/material.dart';
import 'applecarouselslide.dart';
class Loginpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Welcomes Nikhil Programming" ,style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        centerTitle:true,backgroundColor: Colors.blue,
      ),
    body: Center(
      child: Container(
        color: Colors.cyan,
         height: 620,
         width: 350,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter UserName",
                  border: OutlineInputBorder(borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))
                )
              ),
              ),
              SizedBox(height: 20 ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0))
                    )
                )
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                  print("Login Button Click");
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Applecarouselslide() ));
                    },
                      child:Text("Login")),
                  ElevatedButton(onPressed: (){ }, child: Text("SignUp"))
                ]
              ),
              SizedBox(height:20),
              Text("Forget Password")
            ],
          ),
        ),
      ),
    ),
    );
  }
}