import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Uploadimage extends StatefulWidget {
  const Uploadimage({super.key});

  @override
  State<Uploadimage> createState() => _UploadimageState();
}

class _UploadimageState extends State<Uploadimage> {
  File? image;

  String? url;
  bool isloading = false;

  Future<void> _uploadImage() async {

    setState(() {
      isloading=true;
    });
    XFile? pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      image = File(pickedImage!.path);
    });

    final storage = FirebaseStorage.instance;

    Reference reference = storage.ref().child("UserImage").child("image.png");
    UploadTask task = reference.putFile(image!);
    TaskSnapshot taskSnapshot = await task;

    String data = await taskSnapshot.ref.getDownloadURL();

    setState(() {
      url = data;
      isloading=false;
    });
    FirebaseFirestore.instance.collection("user data").doc("").update({
      'url':data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:isloading==true?CircularProgressIndicator(): Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(url!=null)
              Container(
                height: 200,
                width: 200,
                color: Colors.blue,
                child: Image.network(url!),
              ),
            SizedBox(height: 50),

            ElevatedButton(onPressed: _uploadImage, child: Text("Upload")),
          ],
        ),
      ),
    );
  }
}