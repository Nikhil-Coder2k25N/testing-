import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstclass/homepage.dart';
import 'package:pinput/pinput.dart';

class Otpscreen extends StatefulWidget {
  final String number;
  final String? varID;
  const Otpscreen({super.key, required this.number, this.varID});

  @override
  State<Otpscreen> createState() => _OtpscreenState();
}

class _OtpscreenState extends State<Otpscreen> {
  final TextEditingController otp = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<bool> _verifyOTP(String userOTP) async {
    try {
      if (widget.varID == null) {
        return false;
      }
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.varID!,
        smsCode: userOTP,
      );
      UserCredential user = await auth.signInWithCredential(credential);
      return user.user != null;
    } catch (e) {
      return false;
    }
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "OTP Screen",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 400,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Verification",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Text("Enter the code sent to the number"),
                  Text(widget.number),
                  Pinput(
                    length: 6,
                    autofocus: true,
                    controller: otp,
                    obscureText: true,
                    obscuringCharacter: '*',
                    keyboardType: TextInputType.number,
                    onCompleted: (value) async {
                      await _handleOTPVerification(value);
                    },
                    defaultPinTheme: PinTheme(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _handleOTPVerification(otp.text);
                    },
                    child: const Text("Verify"),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> _handleOTPVerification(String value) async {
    bool result = await _verifyOTP(value);

    if (!mounted) return;

    if (result) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("OTP Verified")));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Homepage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("OTP Not Verified")));
    }
  }
}
