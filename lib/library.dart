import 'package:flutter/material.dart';
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.library_books_outlined,size: 100,color: Colors.blue,),
            Text("Library",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
