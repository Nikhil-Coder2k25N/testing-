import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:myfirstclass/otp/otpscreen.dart';
class PhoneNumber extends StatefulWidget {
  const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  final TextEditingController _number = TextEditingController();
  
  String? dialCode = "+91";

  @override
  void dispose() {
    _number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phone Number Screen"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children:[
                  CountryCodePicker(
                    showFlag: false,
                    initialSelection:"+91",
                    onChanged: (code) {
                      setState(() {
                        dialCode=code.dialCode;
                      });
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _number,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        label: Text("Enter Number"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 30,),
              ElevatedButton(onPressed: () {
                final FirebaseAuth auth=FirebaseAuth.instance;
                auth.verifyPhoneNumber(
                  phoneNumber: "$dialCode${_number.text}",
                  timeout: const Duration(seconds: 60),
                  verificationCompleted:(PhoneAuthCredential credential){
                    auth.signInWithCredential(credential);
                  },
                  verificationFailed: (FirebaseAuthException e){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                  },
                  codeSent: (String verificationId, int? resendToken){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Otpscreen(number: "$dialCode${_number.text}",varID:verificationId,)));
                  },
                  codeAutoRetrievalTimeout: (String verificationId){},
                );

               // Navigator.push(context, MaterialPageRoute(builder: (context)=>Otpscreen(number: "$dialCode${_number.text}",)));
              }, child:  const Text("Send OTP"))
            ],
          ),
        ),
      ),
    );
  }
}
