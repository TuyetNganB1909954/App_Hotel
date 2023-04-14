class Hotel {
  final String? id;
  final String hotelName;
  final String description;
  final double price;
  final String imgUrl;
  final String location;
  final int rating;

  Hotel(
      {this.id,
      required this.hotelName,
      required this.description,
      required this.price,
      required this.imgUrl,
      required this.location,
      required this.rating});

  Hotel copyWith(
      {String? id,
      String? hotelName,
      String? description,
      double? price,
      String? imgUrl,
      String? location,
      int? rating}) {
    return Hotel(
        id: id ?? this.id,
        hotelName: hotelName ?? this.hotelName,
        description: description ?? this.description,
        price: price ?? this.price,
        imgUrl: imgUrl ?? this.imgUrl,
        location: location ?? this.location,
        rating: rating ?? this.rating);
  }

  Map<String, dynamic> toJson() {
    return {
      'hotelName': hotelName,
      'description': description,
      'price': price,
      'imgUrl': imgUrl,
      'location': location,
      'rating': rating,
    };
  }

  static Hotel fromJson(Map<String, dynamic> json) {
    return Hotel(
      id: json['id'],
      hotelName: json['hotelName'],
      description: json['description'],
      price: json['price'],
      imgUrl: json['imgUrl'],
      location: json['location'],
      rating: json['rating'],
    );
  }
}
