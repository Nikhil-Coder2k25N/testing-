// class User {
//   int? id;
//   String? name;
//   String? email;
//   String? phone;          // ✅ ALWAYS String
//   String? userType;
//   bool? status;           // ✅ bool
//   String? dob;
//   String? institute;
//   int? finalMarks;
//   String? address;
//   String? city;
//   String? state;
//   String? pincode;
//   String? image;
//   String? emailVerifiedAt;
//   String? createdAt;
//   String? updatedAt;
//   String? logCountry;
//
//   User({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.userType,
//     this.status,
//     this.dob,
//     this.institute,
//     this.finalMarks,
//     this.address,
//     this.city,
//     this.state,
//     this.pincode,
//     this.image,
//     this.emailVerifiedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.logCountry,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: int.tryParse(json['id'].toString()),        // 🔥 SAFE
//       name: json['name']?.toString(),
//       email: json['email']?.toString(),
//       phone: json['phone']?.toString(),               // 🔥 FIX
//       userType: json['user_type']?.toString(),
//       status: json['status'] == true || json['status'] == 1,
//       dob: json['dob']?.toString(),
//       institute: json['institute']?.toString(),
//       finalMarks: json['final_marks'] != null
//           ? int.tryParse(json['final_marks'].toString())
//           : null,
//       address: json['address']?.toString(),
//       city: json['city']?.toString(),
//       state: json['state']?.toString(),
//       pincode: json['pincode']?.toString(),
//       image: json['image']?.toString(),
//       emailVerifiedAt: json['email_verified_at']?.toString(),
//       createdAt: json['created_at']?.toString(),
//       updatedAt: json['updated_at']?.toString(),
//       logCountry: json['log_country']?.toString(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'user_type': userType,
//       'status': status,
//       'dob': dob,
//       'institute': institute,
//       'final_marks': finalMarks,
//       'address': address,
//       'city': city,
//       'state': state,
//       'pincode': pincode,
//       'image': image,
//       'email_verified_at': emailVerifiedAt,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'log_country': logCountry,
//     };
//   }
// }
class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? userType;
  bool? status;
  String? dob;
  String? institute;
  int? finalMarks;
  String? address;
  String? city;
  String? state;
  String? pincode;
  String? image;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? logCountry;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.userType,
    this.status,
    this.dob,
    this.institute,
    this.finalMarks,
    this.address,
    this.city,
    this.state,
    this.pincode,
    this.image,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.logCountry,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: int.tryParse(json['id']?.toString() ?? ''),
      name: json['name']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      userType: json['user_type']?.toString(),

      // 🔥 Handles true / 1 / "1"
      status: json['status'] == true ||
          json['status'] == 1 ||
          json['status']?.toString() == '1',

      dob: json['dob']?.toString(),
      institute: json['institute']?.toString(),
      finalMarks: int.tryParse(json['final_marks']?.toString() ?? ''),
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      state: json['state']?.toString(),
      pincode: json['pincode']?.toString(),
      image: json['image']?.toString(),

      emailVerifiedAt: json['email_verified_at']?.toString(),
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
      logCountry: json['log_country']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'user_type': userType,
      'status': status == true ? 1 : 0, // 🔥 backend friendly
      'dob': dob,
      'institute': institute,
      'final_marks': finalMarks,
      'address': address,
      'city': city,
      'state': state,
      'pincode': pincode,
      'image': image,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'log_country': logCountry,
    };
  }
}
