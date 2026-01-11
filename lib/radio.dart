import 'package:flutter/material.dart';
class RadioDemo extends StatefulWidget {
  const RadioDemo({super.key});

  @override
  State<RadioDemo> createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  @override
  String? gender;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          RadioListTile(
            value: 'Male',
            title: Text("Male"),
            groupValue: gender,
            onChanged: (String? value){
              setState(() {
                gender =value;
              });
            },
          ),
          RadioListTile(
            value: 'Female',
            title: Text("Female"),
            groupValue: gender,
            onChanged: (String? value){
              setState(() {
                gender =value;
              });
            },
          ),
          ElevatedButton(onPressed:(){
            showDialog(context: context, builder: (context)=>AlertDialog(
              title: Text("Gender"),
              content: Text(gender!),
            ));
          }, child: Text("Showing")),
        ],
      ),
    );
  }
}
