import 'package:flutter/material.dart';

import 'carouselslider.dart';
class Appbardesign extends StatefulWidget {
  const Appbardesign({super.key});
  @override
  State<Appbardesign> createState() => _AppbardesignState();
}

class _AppbardesignState extends State<Appbardesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.yellow,Colors.cyan,
            ])
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Icon(Icons.search,color: Colors.black,),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('assets/images/apple.png',fit: BoxFit.cover),
          ),
        ],
        leading: BackButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Crossfile()));
          },
        ),
        backgroundColor: Colors.cyan,
        title: Center(
          child: Text("ABC",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
        ),
      ),
    );
  }
}
