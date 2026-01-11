import 'package:flutter/material.dart';

class Checkbox extends StatefulWidget {
  const Checkbox({super.key});

  @override
  State<Checkbox> createState() => _CheckboxState();
}

class _CheckboxState extends State<Checkbox> {
  Map<String,bool> skills={
    'Flutter':false,
    'React': false,
    'Python':false,
    'c++':false,
  };

  List<String> selectedskills=[];

  void showSavedData() {
    selectedskills = [];
    skills.forEach((key, value) {
      if (value == true) {
        selectedskills.add(key);
      }
    });
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Selected Skills"),
              content: Text(selectedskills.toString()),
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Check Radio"),
        ),

        body: Column(
          children: [
            ...skills.keys.map((String key)
            {
              return CheckboxListTile(
                title:Text(key) ,
                value: skills[key],
                onChanged: (bool? value){
                  setState(() {
                    skills[key]=value!;
                  });
                },
              );
            }).toList(),
            ElevatedButton(onPressed: (){
              showSavedData();

            }, child: Text("Save")),
          ],
        )
    );
  }
}