import 'package:flutter/material.dart';
class MyLoader extends StatefulWidget {
  const MyLoader({super.key});
  @override
  State<MyLoader> createState() => _MyLoaderState();
}
class _MyLoaderState extends State<MyLoader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: CircularProgressIndicator(
              color: Colors.red,
              strokeWidth: 4,
              backgroundColor: Colors.grey,
            )
        )
    );

  }
}