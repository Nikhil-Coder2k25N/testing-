import 'package:flutter/material.dart';
class NavigationDrower extends StatefulWidget {
  const NavigationDrower({super.key});

  @override
  State<NavigationDrower> createState() => _NavigationDrowerState();
}
class _NavigationDrowerState extends State<NavigationDrower> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();   //New
  void _showBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ), builder: (context) {
      return Container(
        height: 100,
        color:Colors.transparent,
          child: Column(
            children: [
              //Text("Hello Dears"),
              Image.asset("assets/images/AirPods Max.png",height:50,width:100,color: Colors.black),            
              ],
          ),
      );
    },);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          _scaffoldKey.currentState!.openDrawer();                   //new
        }, icon: Image.asset("assets/images/AirPods Max.png"),),
        title: Text('Navigation Drawer'),
        actions: [
          PopupMenuButton(
            onSelected: (value){
              print(value);
            },
              itemBuilder: (context)=>[
                PopupMenuItem(
                  value: "Home",
                  child: Text("Home"),
                ),
                PopupMenuItem(
                  value: "About",
                  child: Text("About"),
                ),
                PopupMenuItem(
                  value: "Library",
                  child: Text("Library"),
                ),
                PopupMenuItem(
                  value: "Setting",
                  child: Text("Setting"),
                ),
              ]
          )
        ],
    ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                    ),
                    Text("Nikhil",style: TextStyle(color: Colors.white),),
                    Text("nikhil@gmail.com",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
              ListTile(
                title: Text("Home"),
                leading: Icon(Icons.info),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                  Navigator.pop(context);

                },
              ),
              Divider(),
              ListTile(
                title: Text("About"),
                leading: Icon(Icons.cabin),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                },
              ),
              Divider(),ListTile(
                title: Text("Library"),
                leading: Icon(Icons.library_books),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                },
              ),Divider(),ListTile(
                title: Text("Setting"),
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_forward),
                onTap: (){
                },
              ),
              Divider(),
            ],
          ),),
      body: Container(
        child: Center(
          child: ElevatedButton(onPressed: (){
            _showBottomSheet(context);
          }, child: Text("Open")),
        ),
      ),
        );
  }
}

