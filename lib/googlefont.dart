import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstclass/calls.dart';
import 'package:myfirstclass/chats.dart';
import 'package:myfirstclass/status.dart';
class Googlefont extends StatefulWidget {
  const Googlefont({super.key});

  @override
  State<Googlefont> createState() => _GooglefontState();
}

class _GooglefontState extends State<Googlefont> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text('Googlefont',style: GoogleFonts.lato(
            color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,
          )),
          bottom: TabBar(tabs: [
            Tab(child: Text("Chats"),),
            Tab(child: Text("Status"),),
            Tab(child: Text("Calls"),),
          ],
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.cyan,
            unselectedLabelColor: Colors.white,
          ),

        ),
        body: TabBarView(children: [
          Chats(),
          Status(),
          Calls(),
        ]),

      ),
    );
  }
}
