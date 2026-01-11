import 'package:flutter/material.dart';
class MyDropDown extends StatefulWidget {
  const   MyDropDown({super.key});
  @override
  State<MyDropDown> createState() => _MyDropDownState();
}
class _MyDropDownState extends State<MyDropDown> {
  String? selectedvalue; //to store the selected value
  List<String> items=["Item1","Item2","Item3","Item4"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("DropDown"),
      ),
      body: Center(
        child:  DropdownButton<String>(
            hint: Text("Select"),
            value: selectedvalue,
            icon: Icon(Icons.arrow_drop_down),
            elevation: 16,
            style: TextStyle(color: Colors.black),
            // underline: Container(
            //   height: 2,
            //   color: Colors.black,
            // ),
            onChanged: (value){
              setState(() {
                selectedvalue=value;
              });
            },
            items: items.map((String value){
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList()
        ),
      ),
    );
  }
}