import 'package:flutter/material.dart';
import 'package:myshop/ui/hotel/hotel_card.dart';
import 'package:myshop/ui/hotel/hotel_detail.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:myshop/ui/hotel/hotel_overview_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _HotelAppState createState() => _HotelAppState();
}

class _HotelAppState extends State<MyApp> {
  // List<String> urls = [
  //   "https://resofrance.eu/wp-content/uploads/2018/09/hotel-luxe-mandarin-oriental-paris.jpg",
  //   "https://images.squarespace-cdn.com/content/v1/57d5245815d5db80eadeef3b/1558864684068-1CX3SZ0SFYZA1DFJSCYD/ke17ZwdGBToddI8pDm48kIpXjvpiLxnd0TWe793Q1fcUqsxRUqqbr1mOJYKfIPR7LoDQ9mXPOjoJoqy81S2I8N_N4V1vUb5AoIIIbLZhVYxCRW4BPu10St3TBAUQYVKcZwk0euuUA52dtKj-h3u7rSTnusqQy-ueHttlzqk_avnQ5Fuy2HU38XIezBtUAeHK/Marataba+Safari+lodge",
  //   "https://lh3.googleusercontent.com/proxy/ovCSxeucYYoir_rZdSYq8FfCHPeot49lbYqlk7nXs7sXjqAfbZ2uw_1E9iivLT85LwIZiGSnXuqkdbQ_xKFhd91M7Y05G94d",
  //   "https://q-xx.bstatic.com/xdata/images/hotel/max500/216968639.jpg?k=a65c7ca7141416ffec244cbc1175bf3bae188d1b4919d5fb294fab5ec8ee2fd2&o=",
  //   "https://hubinstitute.com/sites/default/files/styles/1200x500_crop/public/2018-06/photo-1439130490301-25e322d88054.jpeg?h=f720410d&itok=HI5-oD_g",
  //   "https://cdn.contexttravel.com/image/upload/c_fill,q_60,w_2600/v1549318570/production/city/hero_image_2_1549318566.jpg",
  //   "https://www.shieldsgazette.com/images-i.jpimedia.uk/imagefetch/https://jpgreatcontent.co.uk/wp-content/uploads/2020/04/spain.jpg",
  //   "https://www.telegraph.co.uk/content/dam/Travel/2017/November/tunisia-sidi-bou-GettyImages-575664325.jpg",
  //   "https://lp-cms-production.imgix.net/features/2018/06/byrsa-hill-carthage-tunis-tunisia-2d96efe7b9bf.jpg"
  // ];

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Color(0xFFF6F7FF),
  //     appBar: AppBar(
  //       elevation: 0.0,
  //       backgroundColor: Color(0xFFF6F7FF),
  //       title: Row(children: [
  //         IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               Icons.menu,
  //               color: Colors.black,
  //             ))
  //       ]),
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
  //       child: Column(children: [
  //         Text(' ĐẶT PHÒNG KHÁCH SẠN',
  //             style: TextStyle(
  //                 color: Colors.black,
  //                 fontSize: 26.0,
  //                 fontWeight: FontWeight.w600)),
  //         SizedBox(
  //           height: 20.0,
  //         ),
  //         Material(
  //           elevation: 10.0,
  //           borderRadius: BorderRadius.circular(30.0),
  //           shadowColor: Color(0x55434343),
  //           child: TextField(
  //             textAlign: TextAlign.start,
  //             textAlignVertical: TextAlignVertical.center,
  //             decoration: InputDecoration(
  //                 hintText: 'Tìm kiếm ...',
  //                 prefixIcon: Icon(
  //                   Icons.search,
  //                   color: Colors.black,
  //                 ),
  //                 border: InputBorder.none),
  //           ),
  //         ),
  //         SizedBox(height: 30.0),
  //         DefaultTabController(
  //             length: 3,
  //             child: Expanded(
  //               child: Column(children: [
  //                 TabBar(
  //                   indicatorColor: Color(0xFFFE8C68),
  //                   unselectedLabelColor: Color(0xFF555555),
  //                   labelColor: Color(0xFFFE8C68),
  //                   tabs: [
  //                     Tab(
  //                       text: 'aaaa',
  //                     ),
  //                     Tab(
  //                       text: 'aaaa',
  //                     ),
  //                     Tab(
  //                       text: 'aaaa',
  //                     )
  //                   ],
  //                 ),
  //                 SizedBox(height: 20.0),
  //                 Container(
  //                   height: 300.0,
  //                   child: TabBarView(children: [
  //                     Container(
  //                       child: ListView(
  //                         scrollDirection: Axis.horizontal,
  //                         children: [
  //                           HotelCard(urls[0], "Luxury HOtel", "Cần Thơ", 3),
  //                           // HotelCard(urls[1], "Luxury HOtel", "Cần Thơ", 3),
  //                           HotelCard(urls[2], "Luxury HOtel", "Cần Thơ", 3),
  //                           HotelCard(urls[4], "Luxury HOtel", "Cần Thơ", 3),
  //                           HotelCard(urls[5], "Luxury HOtel", "Cần Thơ", 3)
  //                         ],
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListView(
  //                         scrollDirection: Axis.horizontal,
  //                         children: [],
  //                       ),
  //                     ),
  //                     Container(
  //                       child: ListView(
  //                         scrollDirection: Axis.horizontal,
  //                         children: [],
  //                       ),
  //                     )
  //                   ]),
  //                 ),
  //               ]),
  //             )),
  //       ]),
  //     ),
  //     bottomNavigationBar: BottomNavigationBar(
  //       unselectedItemColor: Color(0xFFB7B7B7),
  //       selectedItemColor: Color(0xFFFE8C68),
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home),
  //           label: "Home",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.location_on),
  //           label: "Địa điểm",
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.notifications),
  //           label: "Thông báo",
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ).copyWith(secondary: Colors.deepOrange),
      ),

      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('aaaa'),
      //   ),
      //   body: const Center(
      //     child: Text('data'),
      //   ),
      // ),

      // home: const SafeArea(child: HotelOverviewScreen()),
      home: HotelDetaiScreen(HotelsManager().items[0]),
    );
  }
}
// Future<void> main() async {
//   await dotenv.load();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'MyShop',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Lato',
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.blue,
//         ).copyWith(secondary: Colors.deepOrange),
//       ),

//       // home: Scaffold(
//       //   appBar: AppBar(
//       //     title: const Text('aaaa'),
//       //   ),
//       //   body: const Center(
//       //     child: Text('data'),
//       //   ),
//       // ),

//       home: const SafeArea(child: HotelOverviewScreen()),
//     );
//   }
// }

