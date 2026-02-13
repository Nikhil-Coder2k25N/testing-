import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'loginvalidation.dart';
import 'models/user_model.dart';
import 'profileupdateAPI.dart';

class ProfileAPI extends StatefulWidget {
  const ProfileAPI({super.key});

  @override
  State<ProfileAPI> createState() => _ProfileAPIState();
}

class _ProfileAPIState extends State<ProfileAPI> {

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // 🔥 removes saved login

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const APILogin()),
          (route) => false,
    );
  }

  bool _visible = true;
  Timer? _blinkTimer;

  User? user;
  String? token;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _blinkTimer = Timer.periodic(const Duration(milliseconds: 800), (timer) {
      setState(() => _visible = !_visible);
    });

    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');

    if (email == null || password == null) return;

    try {
      final r = await http.post(
        Uri.parse('https://sakshamdigitaltechnology.com/api/login'),
        body: {'email': email, 'password': password},
      );

      if (r.statusCode == 200) {
        final data = jsonDecode(r.body);

        setState(() {
          user = User.fromJson(data['user']);
          token = data['token'];
          loading = false;
        });
      }
    } catch (e) {
      setState(() => loading = false);
      print("Fetch error: $e");
    }
  }

  @override
  void dispose() {
    _blinkTimer?.cancel();
    super.dispose();
  }

  String valueOrNA(dynamic value) =>
      (value == null || value.toString().isEmpty) ? "N/A" : value.toString();

  @override
  Widget build(BuildContext context) {
    if (loading || user == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: "Logout",
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Logout"),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context); // close dialog
                        _logout(); // then logout
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],

      ),
      backgroundColor: Colors.grey.shade100,
      body: RefreshIndicator(
        onRefresh: fetchUserData,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.black12,
                    child: ClipOval(
                      child: (user!.image != null &&
                          user!.image!.isNotEmpty &&
                          user!.image != "profile.png")
                          ? Image.network(
                        "https://sakshamdigitaltechnology.com/uploads/users/${user!.image}",
                        width: 110,
                        height: 110,
                        fit: BoxFit.cover,
                      )
                          : const Icon(Icons.person, size: 50),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    valueOrNA(user!.name),
                    style: GoogleFonts.aBeeZee(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              buildCard("CONTACT DETAILS", [
                infoRow(CupertinoIcons.mail, "EMAIL", valueOrNA(user!.email)),
                infoRow(CupertinoIcons.phone, "PHONE", valueOrNA(user!.phone)),
                infoRow(CupertinoIcons.location_solid, "ADDRESS", valueOrNA(user!.address)),
              ]),

              const SizedBox(height: 15),

              buildCard("PERSONAL INFO", [
                infoRow(CupertinoIcons.calendar, "DOB", valueOrNA(user!.dob)),
                infoRow(CupertinoIcons.building_2_fill, "CITY", valueOrNA(user!.city)),
                infoRow(CupertinoIcons.map, "STATE", valueOrNA(user!.state)),
                infoRow(CupertinoIcons.number, "PINCODE", valueOrNA(user!.pincode)),
                infoRow(CupertinoIcons.person, "USER TYPE", valueOrNA(user!.userType)),
              ]),

              const SizedBox(height: 20),

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
                          user: user!,
                          apiToken: token!, // 🔥 PASS TOKEN
                        ),
                      ),
                    );

                    if (updated == true) {
                      fetchUserData(); // 🔄 refresh after update
                    }
                  },
                  child: const Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
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
            child: Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black54)),
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
                    Text(label,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold)),
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
