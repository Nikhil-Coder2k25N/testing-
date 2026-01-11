class User {
  int? id;
  String? name;
  String? email;
  int? phone;
  String? userType;
  int? status;
  Null? dob;
  String? institute;
  int? finalMarks;
  Null? address;
  Null? city;
  Null? state;
  Null? pincode;
  String? image;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  Null? logCountry;

  //Constructor
  User(
      {
        required this.id,
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
        this.logCountry});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    userType = json['user_type'];
    status = json['status'];
    dob = json['dob'];
    institute = json['institute'];
    finalMarks = json['final_marks'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    pincode = json['pincode'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logCountry = json['log_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['user_type'] = this.userType;
    data['status'] = this.status;
    data['dob'] = this.dob;
    data['institute'] = this.institute;
    data['final_marks'] = this.finalMarks;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['pincode'] = this.pincode;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['log_country'] = this.logCountry;
    return data;
  }
}