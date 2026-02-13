import 'package:flutter/material.dart';
import 'package:myfirstclass/homepage.dart';
import 'package:myfirstclass/library.dart';
import 'package:myfirstclass/profile.dart';
import 'package:myfirstclass/search.dart';

import '../Profile.dart';
class BottomNavigationAPI extends StatefulWidget {
  @override
  _BottomNavigationAPIState createState() => _BottomNavigationAPIState();
}

class _BottomNavigationAPIState extends State<BottomNavigationAPI> {
  int _currentIndex=1;
  final List <Widget> _pages= [
    // Center(child: Text("Home")),
    // Center(child: Text("Search")),
    // Center(child: Text("Library")),
    // Center(child: Text("Profile")),
    Homepage(),
    SearchPage(),
    LibraryPage(),
    ProfileAPI(),
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Bottom Navigation",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white)),
        backgroundColor: Colors.cyan,),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex=index;
          });
        },
        type: BottomNavigationBarType.fixed, //For Fix Bar Colors
        selectedItemColor: Colors.white,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_off_outlined),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "Library"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: "Profile"),
    ]),
      );
  }

}