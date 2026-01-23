class User {
  final String name;
  final String? dob;
  final String? address;
  final String? city;
  final String? state;
  final String? pincode;

  User({
    required this.name,
    this.dob,
    this.address,
    this.city,
    this.state,
    this.pincode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] ?? "",
      dob: json['dob'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
    );
  }
}
