import 'package:flutter/material.dart';

import '../../models/auth_token.dart';
import '../../models/hotel.dart';
import '../../services/hotel_service.dart';

class HotelsManager with ChangeNotifier {
  // final List<Hotel> _items = [
  //   // Hotel(
  //   //   id: 'p1',
  //   //   hotelName: 'Luxury Hotel',
  //   //   description: 'A red shirt - it is pretty red!',
  //   //   price: 29.99,
  //   //   imgUrl:
  //   //       "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
  //   //   location: 'Can tho',
  //   //   rating: 3,
  //   // ),
  //   // Hotel(
  //   //   id: 'p2',
  //   //   hotelName: 'Luxury Hotel ssss',
  //   //   description: 'A red shirt - it is pretty red!',
  //   //   price: 29.99,
  //   //   imgUrl:
  //   //       "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
  //   //   location: 'Can tho',
  //   //   rating: 5,
  //   // ),
  // ];
  List<Hotel> _items = [];
  final HotelService _hotelService;

  HotelsManager([AuthToken? authToken])
      : _hotelService = HotelService(authToken);

  set authToken(AuthToken? authToken) {
    _hotelService.authToken = authToken;
  }

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

  Future<void> fetchHotels() async {
    _items = await _hotelService.fetchHotels();
    notifyListeners();
  }

  Future<void> addHotel(Hotel hotel) async {
    final newHotel = await _hotelService.addPHotel(hotel);
    if (newHotel != null) {
      _items.add(newHotel);
      notifyListeners();
    }
  }

  Future<void> updateHotel(Hotel hotel) async {
    final index = _items.indexWhere((item) => item.id == hotel.id);
    if (index >= 0) {
      if (await _hotelService.updateHotel(hotel)) {
        _items[index] = hotel;
        notifyListeners();
      }
    }
  }

  Future<void> deleteHotel(String id) async {
    final index = _items.indexWhere((item) => item.id == id);
    Hotel? existingHotel = _items[index];
    _items.removeAt(index);
    notifyListeners();
    if (!await _hotelService.deleteHotel(id)) {
      _items.insert(index, existingHotel);
      notifyListeners();
    }
  }
}
