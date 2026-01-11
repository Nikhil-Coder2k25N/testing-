// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'Home.dart';
// import 'models/user_model.dart';
// import 'registration.dart';
//
// class APILogin extends StatefulWidget {
//   const APILogin({super.key});
//
//   @override
//   State<APILogin> createState() => _APILoginState();
// }
//
// class _APILoginState extends State<APILogin> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//
//   bool _isLoading = false;
//
//   Future<void> _loginUser() async {
//     if (!_formKey.currentState!.validate()) return;
//
//     setState(() => _isLoading = true);
//
//     try {
//       final response = await http.post(
//         Uri.parse("https://sakshamdigitaltechnology.com/api/login"),
//         body: {
//           "email": _email.text.trim(),
//           "password": _password.text,
//         },
//       );
//
//       final data = jsonDecode(response.body);
//       User user=User.fromJson(data['user']);
//
//       if (response.statusCode == 200) {
//         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successful"), backgroundColor: Colors.green,),);
//
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeAPI(user: user,)),);
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(data['message'] ?? "Invalid login credentials"),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Error: $e"),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       _email.clear();
//       _password.clear();
//       setState(() => _isLoading = false);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2F5FF),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: _formKey,
//               child: Container(
//                 padding: const EdgeInsets.all(20),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(18),
//                   boxShadow: const [
//                     BoxShadow(
//                       color: Colors.black12,
//                       blurRadius: 15,
//                       offset: Offset(0, 6),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const Icon(Icons.lock_outline,
//                         size: 70, color: Colors.blue),
//
//                     const SizedBox(height: 10),
//
//                     const Text(
//                       "Login",
//                       style: TextStyle(
//                         fontSize: 26,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blue,
//                       ),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     _buildField(
//                       controller: _email,
//                       label: "Email",
//                       icon: Icons.email_outlined,
//                       validator: (v) {
//                         if (v!.isEmpty) return "Email is required";
//                         if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
//                             .hasMatch(v)) {
//                           return "Invalid email";
//                         }
//                         return null;
//                       },
//                     ),
//
//                     const SizedBox(height: 15),
//
//                     _buildField(
//                       controller: _password,
//                       label: "Password",
//                       icon: Icons.lock_outline,
//                       obscure: true,
//                       validator: (v) =>
//                       v!.isEmpty ? "Password is required" : null,
//                     ),
//
//                     const SizedBox(height: 25),
//
//                     SizedBox(
//                       width: double.infinity,
//                       height: 48,
//                       child: ElevatedButton(
//                         onPressed: _isLoading ? null : _loginUser,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: _isLoading
//                             ? const CircularProgressIndicator(
//                           color: Colors.white,
//                         )
//                             : const Text(
//                           "Login",
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     const SizedBox(height: 15),
//
//                     TextButton(onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Registeration()),);
//                       },
//                       child: const Text(
//                         "Register new account",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   // 🔹 Reusable field
//   Widget _buildField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     bool obscure = false,
//     String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       obscureText: obscure,
//       validator: validator,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//         ),
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'models/user_model.dart';
import 'registration.dart';

class APILogin extends StatefulWidget {
  const APILogin({super.key});

  @override
  State<APILogin> createState() => _APILoginState();
}

class _APILoginState extends State<APILogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool _isLoading = false;

  Future<void> _loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await http.post(
        Uri.parse("https://sakshamdigitaltechnology.com/api/login"),
        body: {
          "email": _email.text.trim(),
          "password": _password.text,
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data['user'] != null) {
        final User user = User.fromJson(data['user']);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Successful"),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeAPI(user: user),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(data['message'] ?? "Invalid login credentials"),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Error: $e"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5FF),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    )
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.lock_outline,
                        size: 70, color: Colors.blue),

                    const SizedBox(height: 10),

                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),

                    const SizedBox(height: 30),

                    _buildField(
                      controller: _email,
                      label: "Email",
                      icon: Icons.email_outlined,
                      validator: (v) {
                        if (v!.isEmpty) return "Email is required";
                        if (!RegExp(
                            r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$')
                            .hasMatch(v)) {
                          return "Invalid email";
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    _buildField(
                      controller: _password,
                      label: "Password",
                      icon: Icons.lock_outline,
                      obscure: true,
                      validator: (v) =>
                      v!.isEmpty ? "Password is required" : null,
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _loginUser,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Registeration(),
                          ),
                        );
                      },
                      child: const Text(
                        "Register new account",
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

  // 🔹 Reusable field (UI SAME)
  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscure = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      validator: validator,
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
