import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/screens.dart';

class HotelCard extends StatelessWidget {
  const HotelCard(this.hotel, {super.key});
  final Hotel hotel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(right: 22.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      elevation: 0.0,
      child: GestureDetector(
        onTap: () {
          // print('Go to product detail screen');
          Navigator.of(context)
              .pushNamed(HotelDetaiScreen.routeName, arguments: hotel.id);
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(hotel.imgUrl),
            fit: BoxFit.cover,
            scale: 2.0,
          )),
          width: 200.0,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    for (var i = 0; i < hotel.rating; i++)
                      Icon(
                        Icons.star,
                        color: Color(0xFFFE8C68),
                      ),
                  ],
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotel.hotelName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 6.0),
                    Text(
                      hotel.location,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
