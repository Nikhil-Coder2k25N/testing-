// import 'package:flutter/material.dart';
//
// import 'models/user_model.dart';
//
// class HomeAPI extends StatefulWidget {
//   User user;
//    HomeAPI({super.key,required this.user});
//
//   @override
//   State<HomeAPI> createState() => _HomeAPIState();
// }
//
// class _HomeAPIState extends State<HomeAPI> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         centerTitle: true,
//         title: Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 200,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Text("name${widget.user.name}"),
//                     Text("email${widget.user.email}"),
//                     Text("image${widget.user.image}"),
//                     Text("state${widget.user.state}"),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

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
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'models/user_model.dart';

class HomeAPI extends StatefulWidget {
  const HomeAPI({super.key, required User user});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  // 🔹 Blink logic
  bool _visible = true;
  Timer? _blinkTimer;

  // 🔹 API state
  User? user;
  bool loading = true;
  String? errorMsg;

  @override
  void initState() {
    super.initState();

    _blinkTimer = Timer.periodic(
      const Duration(milliseconds: 800),
          (timer) {
        setState(() {
          _visible = !_visible;
        });
      },
    );

    fetchProfile();
  }

  @override
  void dispose() {
    _blinkTimer?.cancel();
    super.dispose();
  }

  // 🔹 API CALL
  Future<void> fetchProfile() async {
    try {
      final response = await http.get(
        Uri.parse("https://YOUR_API_URL_HERE"),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        setState(() {
          user = User.fromJson(jsonData);
          loading = false;
        });
      } else {
        setState(() {
          errorMsg = "Server Error";
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
        loading = false;
      });
    }
  }

  String valueOrNA(dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return "N/A";
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (errorMsg != null) {
      return Scaffold(
        body: Center(child: Text(errorMsg!)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white12,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// 🔹 PROFILE HEADER
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black12,
                    backgroundImage: user!.image != null
                        ? NetworkImage(
                      "https://YOUR_IMAGE_PATH/${user!.image}",
                    )
                        : null,
                    child: user!.image == null
                        ? const Icon(Icons.person, size: 50)
                        : null,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    valueOrNA(user!.name),
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeTransition(
                        opacity: _visible
                            ? const AlwaysStoppedAnimation(1)
                            : const AlwaysStoppedAnimation(0),
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        user!.status == 1 ? "Active User" : "Inactive",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 14,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 CONTACT DETAILS
            buildCard(
              "CONTACT DETAILS",
              [
                infoRow(
                  CupertinoIcons.mail,
                  "EMAIL",
                  valueOrNA(user!.email),
                ),
                infoRow(
                  CupertinoIcons.phone,
                  "PHONE",
                  valueOrNA(user!.phone),
                ),
                infoRow(
                  CupertinoIcons.location_solid,
                  "ADDRESS",
                  valueOrNA(user!.address),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// 🔹 PERSONAL INFO
            buildCard(
              "PERSONAL INFO",
              [
                infoRow(
                  CupertinoIcons.calendar,
                  "DOB",
                  valueOrNA(user!.dob),
                ),
                infoRow(
                  CupertinoIcons.briefcase,
                  "INSTITUTE",
                  valueOrNA(user!.institute),
                ),
                infoRow(
                  CupertinoIcons.person,
                  "USER TYPE",
                  valueOrNA(user!.userType),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Reusable UI
  Widget buildCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 30,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            padding: const EdgeInsets.only(left: 15, top: 6),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  Widget infoRow(IconData icon, String label, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFF4EFFD),
                child: Icon(icon, color: const Color(0xFF5506F4)),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      value,
                      style: const TextStyle(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
