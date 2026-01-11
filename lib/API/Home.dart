import 'package:flutter/material.dart';

import '../models/user_model.dart';
class HomeAPI extends StatefulWidget {
  User user;
   HomeAPI({super.key,required this.user});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Text("name${widget.user.name}"),
                    Text("email${widget.user.email}"),
                    Text("image${widget.user.image}"),
                    Text("state${widget.user.state}"),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class HomeAPI extends StatelessWidget {
//   const HomeAPI({super.key});
//
//   // 🔹 Dummy User Data (API se baad me replace kar sakte ho)
//   final Map<String, dynamic> userData = const {
//     "id": 4115,
//     "name": "Nikhil Singh Bhati",
//     "email": "nikhilkoderdc3@gmail.com",
//     "phone": 7223093989,
//     "user_type": "user",
//     "status": 1,
//     "dob": null,
//     "institute": "0",
//     "final_marks": 0,
//     "address": null,
//     "city": null,
//     "state": null,
//     "pincode": null,
//     "image": "profile.png",
//     "email_verified_at": null,
//     "created_at": "2026-01-07T09:31:51.000000Z",
//     "updated_at": "2026-01-07T09:31:51.000000Z",
//     "log_country": null
//   };
//
//   String valueOrNA(dynamic value) {
//     return value == null || value.toString().isEmpty ? "Not Available" : value.toString();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Home"),
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//
//             /// 🔹 PROFILE SECTION
//             CircleAvatar(
//               radius: 45,
//               backgroundColor: Colors.purple.shade100,
//               child: const Icon(Icons.person, size: 50, color: Colors.purple),
//             ),
//             const SizedBox(height: 10),
//
//             Text(
//               userData["name"],
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//
//             Text(
//               userData["email"],
//               style: const TextStyle(color: Colors.grey),
//             ),
//
//             const SizedBox(height: 20),
//
//             /// 🔹 USER INFO CARD
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 3,
//               child: Column(
//                 children: [
//                   infoTile("User ID", userData["id"]),
//                   infoTile("Phone", userData["phone"]),
//                   infoTile("User Type", userData["user_type"]),
//                   infoTile("Status", userData["status"] == 1 ? "Active" : "Inactive"),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             /// 🔹 ACADEMIC / ADDRESS INFO
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 3,
//               child: Column(
//                 children: [
//                   infoTile("Institute", valueOrNA(userData["institute"])),
//                   infoTile("Final Marks", userData["final_marks"]),
//                   infoTile("DOB", valueOrNA(userData["dob"])),
//                   infoTile("Address", valueOrNA(userData["address"])),
//                   infoTile("City", valueOrNA(userData["city"])),
//                   infoTile("State", valueOrNA(userData["state"])),
//                   infoTile("Pincode", valueOrNA(userData["pincode"])),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             /// 🔹 SYSTEM INFO
//             Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 3,
//               child: Column(
//                 children: [
//                   infoTile("Email Verified", valueOrNA(userData["email_verified_at"])),
//                   infoTile("Created At", userData["created_at"]),
//                   infoTile("Updated At", userData["updated_at"]),
//                   infoTile("Login Country", valueOrNA(userData["log_country"])),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// 🔹 Reusable Tile
//   Widget infoTile(String title, dynamic value) {
//     return ListTile(
//       title: Text(title),
//       trailing: Text(
//         valueOrNA(value),
//         style: const TextStyle(fontWeight: FontWeight.w600),
//       ),
//     );
//   }
// }
