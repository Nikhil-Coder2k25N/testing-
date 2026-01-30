import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Admin Panel",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          const Text("Review incoming requests",
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4))
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("ijj",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text("PENDING",
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    )
                  ],
                ),
                const SizedBox(height: 6),
                const Text("COMPUTER SCIENCE",
                    style: TextStyle(
                        color: Color(0xFF4F46E5),
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
                const SizedBox(height: 12),
                const Row(children: [
                  Icon(Icons.email_outlined, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Text("bhatinikhilsingh@gmail.com",
                      style: TextStyle(color: Colors.grey)),
                ]),
                const SizedBox(height: 6),
                const Row(children: [
                  Icon(Icons.phone_outlined, size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Text("yhy", style: TextStyle(color: Colors.grey)),
                ]),
                const SizedBox(height: 6),
                const Row(children: [
                  Icon(Icons.location_on_outlined,
                      size: 18, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                      child: Text("jhj",
                          style: TextStyle(color: Colors.grey))),
                ]),
                const SizedBox(height: 14),
                const Text("REASON",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey)),
                const SizedBox(height: 6),
                const Text("\"ju\"",
                    style: TextStyle(
                        fontSize: 14, fontStyle: FontStyle.italic)),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text("Approve"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {},
                        child: const Text("Reject"),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
