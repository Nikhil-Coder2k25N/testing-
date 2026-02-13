import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile.dart';

class ResetPasswordScreen extends StatefulWidget {
  final String email;
  const ResetPasswordScreen({super.key, required this.email});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController tokenController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  bool loading = false;

  Future<void> resetPassword() async {
    if (tokenController.text.isEmpty ||
        passController.text.isEmpty ||
        confirmPassController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("All fields required")));
      return;
    }

    if (passController.text != confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")));
      return;
    }

    setState(() => loading = true);

    try {
      final response = await http.post(
        Uri.parse("https://sakshamdigitaltechnology.com/api/password-reset"),
        body: {
          "email": widget.email,
          "token": tokenController.text.trim(),
          "password": passController.text.trim(),
          "password_confirmation": confirmPassController.text.trim(),
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? "Password reset successful")),
        );

        // 🔥 Save new login credentials
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', widget.email);
        await prefs.setString('password', passController.text.trim());

        // 🚀 Directly go to Home screen
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ProfileAPI()),
              (route) => false,
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(data['message'] ?? "Reset failed")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }

    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      appBar: AppBar(
        title: const Text(
          "Reset Password",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 15,
                    offset: Offset(0, 6),
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_reset, size: 70, color: Colors.blue),
                  const SizedBox(height: 10),
                  const Text(
                    "Create New Password",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 25),

                  _buildField(tokenController, "Enter Token", Icons.vpn_key),
                  const SizedBox(height: 15),
                  _buildField(passController, "New Password", Icons.lock_outline, obscure: true),
                  const SizedBox(height: 15),
                  _buildField(confirmPassController, "Confirm Password", Icons.lock_reset, obscure: true),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: loading ? null : resetPassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: loading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        "Reset Password",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label,
      IconData icon,
      {bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
