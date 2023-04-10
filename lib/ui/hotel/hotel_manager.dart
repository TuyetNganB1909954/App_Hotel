import '../../models/hotel.dart';

class HotelsManager {
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
  ];

  int get itemCount {
    return _items.length;
  }

  List<Hotel> get items {
    return [..._items];
  }
}
