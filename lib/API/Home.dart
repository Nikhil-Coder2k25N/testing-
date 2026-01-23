import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myfirstclass/API/profileupdateAPI.dart';
import 'models/user_model.dart';

class HomeAPI extends StatefulWidget {
  final User user;

  const HomeAPI({super.key, required this.user});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  bool _visible = true;
  Timer? _blinkTimer;

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
  }

  @override
  void dispose() {
    _blinkTimer?.cancel();
    super.dispose();
  }

  String valueOrNA(dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return "N/A";
    }
    return value.toString();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.user; // ✅ LOCAL REFERENCE

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "My Profile",
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            /// 🔹 PROFILE HEADER
            Column(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black12,
                  child: ClipOval(
                    child: (user.image != null &&
                        user.image!.isNotEmpty &&
                        user.image != "profile.png") // 🔥 MOST IMPORTANT LINE
                        ? Image.network(
                      "https://sakshamdigitaltechnology.com/profile/${user.image}",
                      width: 110,
                      height: 110,
                      fit: BoxFit.cover,
                    )
                        : const Icon(Icons.person, size: 50),
                  ),
                ),

                const SizedBox(height: 10),
                Text(
                  valueOrNA(user.name),
                  style: GoogleFonts.aBeeZee(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
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
                      user.status == true ? "Active User" : "Inactive",
                      style: const TextStyle(color: Colors.black54),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 25),

            /// 🔹 CONTACT DETAILS
            buildCard(
              "CONTACT DETAILS",
              [
                infoRow(CupertinoIcons.mail, "EMAIL", valueOrNA(user.email)),
                infoRow(CupertinoIcons.phone, "PHONE", valueOrNA(user.phone)),
                infoRow(
                  CupertinoIcons.location_solid,
                  "ADDRESS",
                  valueOrNA(user.address),
                ),
              ],
            ),

            const SizedBox(height: 15),

            /// 🔹 PERSONAL INFO
            buildCard(
              "PERSONAL INFO",
              [
                infoRow(CupertinoIcons.calendar, "DOB", valueOrNA(user.dob)),
                infoRow(
                  CupertinoIcons.building_2_fill,
                  "CITY",
                  valueOrNA(user.city),
                ),
                infoRow(CupertinoIcons.map, "STATE", valueOrNA(user.state)),
                infoRow(
                  CupertinoIcons.number,
                  "PINCODE",
                  valueOrNA(user.pincode),
                ),
                infoRow(
                  CupertinoIcons.person,
                  "USER TYPE",
                  valueOrNA(user.userType),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// 🔹 EDIT PROFILE BUTTON
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  final updated = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UpdateProfile(
                        user: user,
                        apiToken: "ta4uTtriXsQQbg4F8kb0ws4EGh73",
                        // ❗ YAHAN URL NAHI, LOGIN TOKEN AAYEGA
                      ),
                    ),
                  );

                  if (updated == true) {
                    setState(() {}); // refresh UI
                  }
                },
                child: const Text("Edit Profile"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 Reusable Card
  Widget buildCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
          ),
          ...children,
        ],
      ),
    );
  }

  /// 🔹 Info Row (NO IMAGE HERE ❌)
  Widget infoRow(IconData icon, String label, String value) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
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
                    Text(value, style: const TextStyle(fontSize: 14)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
