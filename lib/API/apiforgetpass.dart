import 'package:flutter/material.dart';
import 'loginvalidation.dart';
class Apiforgetpass extends StatefulWidget {
  const Apiforgetpass({super.key});

  @override
  State<Apiforgetpass> createState() => _ApiforgetpassState();
}

class _ApiforgetpassState extends State<Apiforgetpass> {
  final TextEditingController emailController = TextEditingController();

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
  }

  void handleReset() {
    String email = emailController.text.trim();

    if (email.isEmpty || !isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please enter a valid email"))
      );
      return;
    }
    //written a code for forgot password api logic here

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset link sent to $email"))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot password"),backgroundColor: Colors.white,centerTitle: true,),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Please enter you email address to \nreceive a verification code",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black54,fontWeight:FontWeight.w500,),
              ),
              const SizedBox(height: 30),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: handleReset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Send Link",style: TextStyle(color: Colors.white,fontSize: 18),),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const APILogin()),
                  );
                },
                child: const Text(
                  "Back to Login",
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
    );
  }
}
