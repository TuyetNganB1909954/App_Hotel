import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myshop/models/hotel.dart';

import '../models/auth_token.dart';

import 'firebase_services.dart';

class HotelService extends FirebaseService {
  HotelService([AuthToken? authToken]) : super(authToken);

  Future<List<Hotel>> fetchHotels() async {
    final List<Hotel> hotels = [];

    try {
      // final filters = 'orderBy="creatorId"&equalTo="$userId"';
      final hotelsUrl = Uri.parse('$databaseUrl/hotels.json?auth=$token');

      final response = await http.get(hotelsUrl);
      final hotelsMap = json.decode(response.body) as Map<String, dynamic>;

      if (response.statusCode != 200) {
        print(hotelsMap['error']);
        return hotels;
      }

      hotelsMap.forEach((hotelId, hotel) {
        hotels.add(
          Hotel.fromJson({
            'id': hotelId,
            ...hotel,
          }),
        );
      });
      return hotels;
    } catch (error) {
      print(error);
      return hotels;
    }
  }

  Future<Hotel?> addPHotel(Hotel hotel) async {
    try {
      final url = Uri.parse('$databaseUrl/hotels.json?auth=$token');
      final response = await http.post(url,
          body: json.encode(hotel.toJson()
            ..addAll({
              'creatorId': userId,
            })));
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return hotel.copyWith(id: json.decode(response.body)['name']);
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<bool> updateHotel(Hotel hotel) async {
    try {
      final url = Uri.parse('$databaseUrl/hotels/${hotel.id}.json?auth=$token');
      final response = await http.patch(url, body: json.encode(hotel.toJson()));
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> deleteHotel(String id) async {
    try {
      final url = Uri.parse('$databaseUrl/hotels/$id.json?auth=$token');
      final response = await http.delete(url);
      if (response.statusCode != 200) {
        throw Exception(json.decode(response.body)['error']);
      }
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }
}
