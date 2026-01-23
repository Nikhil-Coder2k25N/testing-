import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class ProfileService {
  static const String url =
      "https://www.sakshamdigitaltechnology.com/api/user-profile";

  static Future<User> updateProfile({
    required String name,
    required String dob,
    required String address,
    required String city,
    required String state,
    required String pincode,
    File? image,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll({
      "name": name,
      "dob": dob,
      "address": address,
      "city": city,
      "state": state,
      "pincode": pincode,
    });

    if (image != null) {
      request.files.add(
        await http.MultipartFile.fromPath("image", image.path),
      );
    }

    final response = await request.send();
    final body = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final json = jsonDecode(body);
      return User.fromJson(json['user']);
    } else {
      throw Exception("Update failed");
    }
  }
}
