import 'package:flutter/material.dart';

import '../../models/hotel.dart';

class HotelsManager with ChangeNotifier {
  final List<Hotel> _items = [
    Hotel(
      id: 'p1',
      hotelName: 'Luxury Hotel',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgUrl:
          "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
      location: 'Can tho',
      rating: 3,
    ),
    Hotel(
      id: 'p2',
      hotelName: 'Luxury Hotel ssss',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imgUrl:
          "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
      location: 'Can tho',
      rating: 5,
    ),
  ];

  int get itemsCount {
    return _items.length;
  }

  List<Hotel> get items {
    return [..._items];
  }

  Hotel? findById(String id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (error) {
      return null;
    }
  }
}
