import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'Profile.dart';
import 'loginvalidation.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  State<Registeration> createState() => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  Future<void> _registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      final response = await http.post(
        Uri.parse('https://sakshamdigitaltechnology.com/api/register'),
        body: {
          'name': _name.text.trim(),
          'email': _email.text.trim(),
          'phone': _phone.text.trim(),
          'password': _password.text.trim(),
          'password_confirmation': _confirmPassword.text.trim(),
        },
      );

      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      print("REGISTER RESPONSE: $jsonData");

      // 🔴 ERROR CASE
      if (jsonData['status'] == 'error') {
        Map<String, dynamic> errors = jsonData['errors'];
        String errorMessage = '';

        errors.forEach((key, value) {
          errorMessage += value[0] + '\n';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        return;
      }

      // 🟢 SUCCESS CASE
      if (jsonData['status'] == 'success') {
        final prefs = await SharedPreferences.getInstance();

        // ✅ Save credentials for auto-login (same as login screen)
        await prefs.setString('email', _email.text.trim());
        await prefs.setString('password', _password.text.trim());

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("User Registered Successfully")),
        );

        // ✅ Go to Home (Home will fetch user + token itself)
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ProfileAPI()),
              (route) => false,
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Form(
              key: _formKey,
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
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.person_add_alt_1, size: 70, color: Colors.blue),
                    const SizedBox(height: 10),
                    const Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 25),

                    _buildField(_name, "Full Name", Icons.person_outline),
                    _buildEmailField(),
                    _buildPhoneField(),
                    _buildPasswordField(),
                    _buildConfirmPasswordField(),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _registerUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const APILogin()),
                        );
                      },
                      child: const Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(TextEditingController controller, String label, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        validator: (value) =>
        value == null || value.isEmpty ? "$label is required" : null,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _email,
        validator: (value) {
          if (value == null || value.isEmpty) return "Email is required";
          if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
            return "Enter valid email";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "Email",
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildPhoneField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _phone,
        keyboardType: TextInputType.phone,
        validator: (value) {
          if (value == null || value.isEmpty) return "Phone number is required";
          if (value.length != 10) return "Enter valid 10 digit number";
          return null;
        },
        decoration: InputDecoration(
          labelText: "Phone Number",
          prefixIcon: const Icon(Icons.phone_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) return "Password is required";
          if (value.length < 6) return "Minimum 6 characters required";
          return null;
        },
        decoration: InputDecoration(
          labelText: "Password",
          prefixIcon: const Icon(Icons.lock_outline),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: _confirmPassword,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) return "Confirm password is required";
          if (value != _password.text) return "Password does not match";
          return null;
        },
        decoration: InputDecoration(
          labelText: "Confirm Password",
          prefixIcon: const Icon(Icons.lock_reset),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
