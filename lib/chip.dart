import 'package:flutter/material.dart';
class ChoiceBarchips extends StatefulWidget {
  const ChoiceBarchips({super.key});

  @override
  State<ChoiceBarchips> createState() => _ChoiceBarchipsState();
}

class _ChoiceBarchipsState extends State<ChoiceBarchips> {
  String selected ="Flutter";
  @override
  List<String>listchoice =['Flutter','Kotlin','C++',"Java","go","r","C"];
  List<String>Selectedlanguages =[ ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(title: Text("Choice-Chip",style: TextStyle(color: Colors.yellow),),backgroundColor: Colors.black,),
      body: Center(
        child: Wrap(
          spacing: 40,
          children: listchoice
              .map(
                (item)=>
                ChoiceChip(
                  shape: StadiumBorder(),
                  label: Text(item),
                  selected: Selectedlanguages.contains(item),
                  onSelected: (bool select)
                  {
                    setState(() {
                      if ( select == true) {
                        Selectedlanguages.add(item);
                      }
                      else {
                        Selectedlanguages.remove(item);
                      };
                    });

                  },
                  selectedColor: Colors.pink,
                ),
          )
              .toList(),
        ),
        // child: Chip(label: Text("Chat"),backgroundColor: Colors.green,shape:RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(20),
        // ),
        // //   avatar: CircleAvatar(
        // //   child: Icon(Icons.arrow_back_ios),
        // // ),
        //   elevation: 4,
        //   shadowColor: Colors.cyan,
        //   padding: EdgeInsets.all(10),
        //   deleteIcon: Icon(Icons.cancel,),
        //   onDeleted: (){
        //     print("Deleted");
        //   },
       // ),
      ),
    );
  }
}
