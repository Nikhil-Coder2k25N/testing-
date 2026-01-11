import 'package:flutter/material.dart';
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _searchState();
}

class _searchState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search,size: 100,color: Colors.blue,),
            Text("Search",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),)
          ],
        ),
      ),
    );
  }
}
