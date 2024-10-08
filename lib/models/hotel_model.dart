class HotelModel {
  String? name;
  String? city;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List<String>? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;
  String? country;
  String? id;

  HotelModel(
      {this.name,
      this.city,
      this.price,
      this.imageUrl,
      this.rating,
      this.address,
      this.phone,
      this.mapUrl,
      this.photos,
      this.numberOfKitchens,
      this.numberOfBedrooms,
      this.numberOfCupboards,
      this.country,
      this.id});

  HotelModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    city = json['city'];
    price = json['price'];
    imageUrl = json['image_url'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'].cast<String>();
    numberOfKitchens = json['number_of_kitchens'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    country = json['country'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['city'] = city;
    data['price'] = price;
    data['image_url'] = imageUrl;
    data['rating'] = rating;
    data['address'] = address;
    data['phone'] = phone;
    data['map_url'] = mapUrl;
    data['photos'] = photos;
    data['number_of_kitchens'] = numberOfKitchens;
    data['number_of_bedrooms'] = numberOfBedrooms;
    data['number_of_cupboards'] = numberOfCupboards;
    data['country'] = country;
    data['id'] = id;
    return data;
  }
}
