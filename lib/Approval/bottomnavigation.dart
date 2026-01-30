import 'package:flutter/material.dart';
import 'package:myfirstclass/Approval/user.dart';
import 'admin.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    UserPage(),
    AdminPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => setState(() => selectedIndex = 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_outline,
                      color: selectedIndex == 0
                          ? const Color(0xFF4F46E5)
                          : Colors.grey),
                  const SizedBox(height: 4),
                  Text("USER",
                      style: TextStyle(
                          fontSize: 12,
                          color: selectedIndex == 0
                              ? const Color(0xFF4F46E5)
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => setState(() => selectedIndex = 1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.admin_panel_settings_outlined,
                      color: selectedIndex == 1
                          ? const Color(0xFF4F46E5)
                          : Colors.grey),
                  const SizedBox(height: 4),
                  Text("ADMIN",
                      style: TextStyle(
                          fontSize: 12,
                          color: selectedIndex == 1
                              ? const Color(0xFF4F46E5)
                              : Colors.grey,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
