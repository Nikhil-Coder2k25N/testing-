import 'package:flutter/material.dart';
class DialogScreen extends StatefulWidget {
  const DialogScreen({super.key});

  @override
  State<DialogScreen> createState() => _DialogScreenState();
}
class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dialog Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {
          showDialog(context: context, builder: (c){
            return AlertDialog(
              title: const Text("Exit?"),
              content: Text("Sure You want to exit?"),
              actions: [
                ElevatedButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(minutes: 1),
                        content: const Text("Exit",style:TextStyle(
                          color: Colors.white,
                        ),),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        action: SnackBarAction(
                          label: "Close",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          textColor: Colors.white,),
                      ));
                  //Navigator.pop(context);
                }, child: Text("Yes")),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("No")),
              ],
            );
            

            // return Dialog(
            //   child:SizedBox(
            //     height: 200,
            //     child: Center(child: Text("Hello Users"))
            //   ),
            // );
          },
          barrierDismissible: false
          );
        }, child: Text("Open")),
      ),
    );
  }
}
