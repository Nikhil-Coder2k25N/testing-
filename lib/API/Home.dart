import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/user_model.dart';

class HomeAPI extends StatefulWidget {
  final User user; // ✅ MUST STORE USER

  const HomeAPI({super.key, required this.user});

  @override
  State<HomeAPI> createState() => _HomeAPIState();
}

class _HomeAPIState extends State<HomeAPI> {
  bool _visible = true;
  Timer? _blinkTimer;

  late User user; // ✅ non-null safe

  @override
  void initState() {
    super.initState();

    // ✅ Assign passed user
    user = widget.user;

    _blinkTimer = Timer.periodic(
      const Duration(milliseconds: 800),
          (_) {
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

  String valueOrNA(dynamic v) {
    if (v == null || v.toString().isEmpty) {
      return "N/A";
    }
    return v.toString();
  }

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: Colors.white,
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
                    child: const Icon(Icons.person, size: 50),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    valueOrNA(user.name),
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
                        child: const CircleAvatar(
                          radius: 4,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        user.status == 1 ? "Active User" : "Inactive",
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
                  valueOrNA(user.email),
                ),
                infoRow(
                  CupertinoIcons.phone,
                  "PHONE",
                  valueOrNA(user.phone),
                ),
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
                infoRow(
                  CupertinoIcons.calendar,
                  "DOB",
                  valueOrNA(user.dob),
                ),
                infoRow(
                  CupertinoIcons.briefcase,
                  "INSTITUTE",
                  valueOrNA(user.institute),
                ),
                infoRow(
                  CupertinoIcons.person,
                  "USER TYPE",
                  valueOrNA(user.userType),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// 🔹 REUSABLE CARD
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
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

  /// 🔹 INFO ROW
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
