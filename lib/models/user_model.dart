class UserModel {
  int? id;
  String? name;
  int? age;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  String? occupation;
  List<String>? hobbies;

  UserModel(
      {this.id,
      this.name,
      this.age,
      this.username,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.occupation,
      this.hobbies});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
    username = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
    occupation = json['occupation'];
    hobbies = json['hobbies'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    data['username'] = username;
    data['email'] = email;
    if (address != null) {
      data['address'] = address!.toJson();
    }
    data['phone'] = phone;
    data['website'] = website;
    data['occupation'] = occupation;
    data['hobbies'] = hobbies;
    return data;
  }
}

class Address {
  String? street;
  String? city;
  String? zip;

  Address({this.street, this.city, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['zip'] = zip;
    return data;
  }
}
