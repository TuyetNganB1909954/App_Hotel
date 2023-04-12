import 'package:flutter/material.dart';
import 'package:myshop/ui/hotel/edit_hote_screen.dart';
import 'package:myshop/ui/hotel/order_hotel_screen.dart';
import '../../models/hotel.dart';
import '../shared/app_drawer.dart';

class HotelDetaiScreen extends StatelessWidget {
  const HotelDetaiScreen(this.hotel, {super.key});
  final Hotel hotel;
  static const routeName = '/hotel-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFF6F7FF),
        elevation: 0.0,
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          );
        }),
      ),
      // backgroundColor: Color(0xFFF6F7FF),
      body: Padding(
        padding: const EdgeInsets.all(00.0),
        child: Column(children: [
          DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(children: [
                  Container(
                    height: 300.0,
                    child: TabBarView(children: [
                      Container(
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25.0),
                            image: DecorationImage(
                                image: NetworkImage(hotel.imgUrl),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  hotel.hotelName,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(height: 6.0),
                                Text(
                                  hotel.location,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ]),
                        ),
                      ),
                    ]),
                  ),
                ]),
              )),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: Column(
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
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    "Chi tiết",
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Text(
                    hotel.description,
                    textAlign: TextAlign.start,
                    softWrap: true,
                    style:
                        TextStyle(fontSize: 21.0, fontWeight: FontWeight.w200),
                  ),
                )
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      print('aaaaaaaaaaaa');
                      Navigator.of(context).pushNamed(
                        OrderHotelScreen.routeName,
                      );
                    },
                    child: Text(
                      'Đặt ngay',
                      style: TextStyle(
                        fontSize: 25.0, // insert your font size here
                      ),
                    ),
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.orange),
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(
                                horizontal: 30.0, vertical: 10)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                    side: BorderSide(color: Colors.red)))),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
