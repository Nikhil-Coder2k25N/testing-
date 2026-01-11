import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  XFile? image;
  Future<void> _pickImage() async{
    XFile? pickedImage= await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      image=pickedImage;
      print(image);
    });

    //ImagePicker().pickImage(source: ImageSource.gallery);
    ImagePicker().pickImage(source: ImageSource.camera);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 100,
                    backgroundImage: image==null?AssetImage("assets/images/abc.png"):FileImage(File(image!.path)),
                ),
                Positioned(bottom: 8,
                right: 10,
                  child: InkWell(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.add_a_photo),
                    ),
                  ),
                )
              ],
            ),
            
            // CircleAvatar(
            //   radius: 100,
            //   backgroundImage: AssetImage("assets/images/abc.png"),
            // ),
            SizedBox(height: 20,),
            Text("Nikhil Singh",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
