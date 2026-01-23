import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'models/user_model.dart';

class UpdateProfile extends StatefulWidget {
  final User user;
  final String apiToken; // 🔑 REAL LOGIN TOKEN

  const UpdateProfile({
    super.key,
    required this.user,
    required this.apiToken,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController dob;
  late TextEditingController address;
  late TextEditingController city;
  late TextEditingController state;
  late TextEditingController pincode;

  File? _image;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: widget.user.name);
    dob = TextEditingController(text: widget.user.dob);
    address = TextEditingController(text: widget.user.address);
    city = TextEditingController(text: widget.user.city);
    state = TextEditingController(text: widget.user.state);
    pincode = TextEditingController(text: widget.user.pincode);
  }

  /// 📸 PICK IMAGE (optional)
  Future<void> pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  /// 🚀 UPDATE PROFILE API
  Future<void> updateProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => loading = true);

    final request = http.MultipartRequest(
      'POST',
      Uri.parse('https://sakshamdigitaltechnology.com/api/user-profile'),
    );

    request.headers.addAll({
      'Authorization': 'Bearer ${widget.apiToken}', // 🔑 TOKEN ONLY
      'Accept': 'application/json',
    });

    // 🔹 REQUIRED FIELDS
    request.fields.addAll({
      'name': name.text.trim(),
      'dob': dob.text.trim(),          // YYYY-MM-DD
      'address': address.text.trim(),
      'city': city.text.trim(),
      'state': state.text.trim(),
      'pincode': pincode.text.trim(),
    });

    // 🔹 OPTIONAL IMAGE
    if (_image != null) {
      request.files.add(
        await http.MultipartFile.fromPath('image', _image!.path),
      );
    }

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    setState(() => loading = false);

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile Updated Successfully")),
      );
      Navigator.pop(context, true); // ✅ SUCCESS SIGNAL TO HOME
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responseBody)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              /// 🔹 IMAGE PREVIEW (NO 404 CALLS)
              GestureDetector(
                onTap: pickImage,
                child: CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.black12,
                  backgroundImage: _image != null
                      ? FileImage(_image!)
                      : (widget.user.image != null &&
                      widget.user.image!.isNotEmpty &&
                      widget.user.image != "profile.png")
                      ? NetworkImage(
                    "https://sakshamdigitaltechnology.com/profile/${widget.user.image}",
                  )
                      : null,
                  child: (_image == null &&
                      (widget.user.image == null ||
                          widget.user.image == "profile.png"))
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),

              const SizedBox(height: 20),

              buildField(name, "Full Name"),
              buildDobField(dob),
              buildField(address, "Address"),
              buildField(city, "City"),
              buildField(state, "State"),
              buildField(pincode, "Pincode"),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: loading ? null : updateProfile,
                  child: loading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Update Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔹 Generic required field
  Widget buildField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        validator: (v) =>
        v == null || v.isEmpty ? "$label required" : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  /// 🔹 DOB with format validation (YYYY-MM-DD)
  Widget buildDobField(TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.datetime,
        validator: (v) {
          if (v == null || v.isEmpty) return "DOB required";
          if (!RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(v)) {
            return "Use YYYY-MM-DD format";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: "DOB (YYYY-MM-DD)",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
