import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../models/user_model.dart';
import 'profileservice.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameCtrl;
  late TextEditingController dobCtrl;
  late TextEditingController addressCtrl;
  late TextEditingController cityCtrl;
  late TextEditingController stateCtrl;
  late TextEditingController pincodeCtrl;

  File? image;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    nameCtrl = TextEditingController(text: widget.user.name);
    dobCtrl = TextEditingController(text: widget.user.dob ?? "");
    addressCtrl = TextEditingController(text: widget.user.address ?? "");
    cityCtrl = TextEditingController(text: widget.user.city ?? "");
    stateCtrl = TextEditingController(text: widget.user.state ?? "");
    pincodeCtrl = TextEditingController(text: widget.user.pincode ?? "");
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    dobCtrl.dispose();
    addressCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    pincodeCtrl.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => image = File(picked.path));
    }
  }

  Future<void> updateProfile() async {
    setState(() => isLoading = true);

    try {
      User updatedUser = await ProfileService.updateProfile(
        name: nameCtrl.text.trim(),
        dob: dobCtrl.text.trim(),
        address: addressCtrl.text.trim(),
        city: cityCtrl.text.trim(),
        state: stateCtrl.text.trim(),
        pincode: pincodeCtrl.text.trim(),
        image: image,
      );

      Navigator.pop(context, updatedUser);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile update failed")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            /// PROFILE IMAGE
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? const Icon(Icons.camera_alt, size: 30)
                    : null,
              ),
            ),

            const SizedBox(height: 20),

            buildField("Full Name", nameCtrl),
            buildField("DOB (YYYY-MM-DD)", dobCtrl),
            buildField("Address", addressCtrl),
            buildField("City", cityCtrl),
            buildField("State", stateCtrl),
            buildField("Pincode", pincodeCtrl,
                keyboard: TextInputType.number),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: isLoading ? null : updateProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                  "UPDATE PROFILE",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(
      String label,
      TextEditingController controller, {
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: GoogleFonts.aBeeZee(),
      ),
    );
  }
}
