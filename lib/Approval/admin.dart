import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  String? loadingId; 

  Future<void> sendToGoogleSheet(Map<String, dynamic> data) async {
    const String url =
        "https://script.google.com/macros/s/AKfycbxxdguLI4OcYaDPIMUWiXNtb_K9bvTocP26UIwvVHP7zPVpqfFLcDIqdfcnVwGZDSDN/exec";

    await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );
  }

  Future<void> updateStatus(
      String id, Map<String, dynamic> data, String newStatus) async {

    setState(() => loadingId = id);

    await FirebaseFirestore.instance
        .collection('Applications')
        .doc(id)
        .update({'status': newStatus});

    await sendToGoogleSheet({
      "name": data['name'],
      "email": data['email'],
      "phone": data['phone'],
      "department": data['department'],
      "address": data['address'],
      "reason": data['reason'],
      "status": newStatus,
    });

    setState(() => loadingId = null);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Applications')
                  .where('status', isEqualTo: 'Pending')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No pending applications"));
                }

                final applications = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: applications.length,
                  itemBuilder: (context, index) {
                    final doc = applications[index];
                    final data = doc.data() as Map<String, dynamic>;

                    final id = doc.id;
                    final name = data['name'] ?? '';
                    final email = data['email'] ?? '';
                    final phone = data['phone'] ?? '';
                    final department = data['department'] ?? '';
                    final address = data['address'] ?? '';
                    final reason = data['reason'] ?? '';

                    final isLoading = loadingId == id;

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
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
                          Text(name,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 6),
                          Text(department.toUpperCase(),
                              style: const TextStyle(
                                  color: Color(0xFF4F46E5),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12)),
                          const SizedBox(height: 12),
                          Row(children: [
                            const Icon(Icons.email_outlined,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text(email,
                                style: const TextStyle(color: Colors.grey)),
                          ]),
                          const SizedBox(height: 6),
                          Row(children: [
                            const Icon(Icons.phone_outlined,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 8),
                            Text(phone,
                                style: const TextStyle(color: Colors.grey)),
                          ]),
                          const SizedBox(height: 6),
                          Row(children: [
                            const Icon(Icons.location_on_outlined,
                                size: 18, color: Colors.grey),
                            const SizedBox(width: 8),
                            Expanded(
                                child: Text(address,
                                    style: const TextStyle(
                                        color: Colors.grey))),
                          ]),
                          const SizedBox(height: 14),
                          const Text("REASON",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey)),
                          const SizedBox(height: 6),
                          Text("\"$reason\"",
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic)),
                          const SizedBox(height: 20),

                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                  ),
                                  onPressed: isLoading
                                      ? null
                                      : () => updateStatus(id, data, "Approved"),
                                  child: isLoading
                                      ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                      : const Text("Approve",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(12)),
                                  ),
                                  onPressed: isLoading
                                      ? null
                                      : () => updateStatus(id, data, "Rejected"),
                                  child: isLoading
                                      ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                      : const Text("Reject",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
