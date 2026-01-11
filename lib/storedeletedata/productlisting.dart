import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/storedeletedata/editupdatedata.dart';

import 'datasṭōre.dart';

class ProductListing extends StatefulWidget {
  const ProductListing({super.key});

  @override
  State<ProductListing> createState() => _ProductListingState();
}
class _ProductListingState extends State<ProductListing> {
  QuerySnapshot? snapshot;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getdata();
  }

  Future<void> getdata() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });

    try {
      snapshot = await FirebaseFirestore.instance.collection("UserData").get();
    } catch (e) {
      print("Error fetching data: $e");
    }

    if (!mounted) return;
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _deleteItem(String docId) async {
    try {
      await FirebaseFirestore.instance.collection("UserData").doc(docId).delete();
      // Refresh the data after deletion
      await getdata();
    } catch (e) {
      print("Error deleting item: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User List Page",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Row(
            children: [
              IconButton(onPressed: (){
               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Store()));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home1()));
              }, icon: Icon(Icons.add,size: 35,)),
              SizedBox(width: 10,)
            ],
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: getdata,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : (snapshot == null || snapshot!.docs.isEmpty)
                ? const Center(child: Text("No users found."))
                : ListView.builder(
                    itemCount: snapshot!.size,
                    itemBuilder: (context, index) {
                      final doc = snapshot?.docs[index];

                      return Card(
                        color: Colors.red,
                        child: ListTile(
                          leading: CircleAvatar(child: Text("${index + 1}")),
                          trailing: IconButton(
                            onPressed: () {
                              if (doc != null) {
                                _deleteItem(doc.id);
                              }
                            },
                            icon: Icon(Icons.delete, color: Colors.white),
                          ),
                          title: Text("${doc?["email"]}", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${doc?["name"]}", style: TextStyle(color: Colors.white)),
                              Text("${doc?["number"]}", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
