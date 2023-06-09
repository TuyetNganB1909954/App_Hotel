import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/auth/auth_manager.dart';
import 'package:myshop/ui/hotel/edit_hote_screen.dart';
import 'package:myshop/ui/hotel/hotel_card.dart';
import 'package:myshop/ui/hotel/hotel_detail.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:myshop/ui/hotel/hotel_overview_screen.dart';
import 'package:myshop/ui/hotel/order_hotel_screen.dart';
import 'package:myshop/ui/hotel/user_hotel_screen.dart';
import 'package:myshop/ui/hotel/user_hotel_tile.dart';
import 'package:myshop/ui/splash_screen.dart';
import 'package:provider/provider.dart';

import 'ui/auth/auth_screen.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          // ChangeNotifierProvider(create: (ctx) => HotelsManager()),
          ChangeNotifierProvider(create: (ctx) => AuthManager()),
          ChangeNotifierProxyProvider<AuthManager, HotelsManager>(
              create: (ctx) => HotelsManager(),
              update: ((ctx, authManager, hotelsManager) {
                hotelsManager!.authToken = authManager.authToken;
                return hotelsManager;
              })),
        ],
        child: Consumer<AuthManager>(builder: (context, authManager, child) {
          return MaterialApp(
            title: 'MyShop',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
              ).copyWith(secondary: Color.fromARGB(255, 252, 85, 34)),
            ),
            // home: const SafeArea(child: HotelOverviewScreen()),
            // home: HotelDetaiScreen(HotelsManager().items[0]),
            // home: const SafeArea(child: UserHotelScreen())
            home: authManager.isAuth
                ? const HotelOverviewScreen()
                : FutureBuilder(
                    future: authManager.tryAutoLogin(),
                    builder: (context, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen();
                    }),
            routes: {
              UserHotelScreen.routeName: (ctx) => const UserHotelScreen()
            },
            onGenerateRoute: (settings) {
              if (settings.name == HotelDetaiScreen.routeName) {
                final hotelID = settings.arguments as String;
                return MaterialPageRoute(builder: (ctx) {
                  return HotelDetaiScreen(
                    ctx.read<HotelsManager>().findById(hotelID)!,
                  );
                });
              }
              if (settings.name == EditHotelScreen.routeName) {
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditHotelScreen(
                      productId != null
                          ? ctx.read<HotelsManager>().findById(productId)
                          : null,
                    );
                  },
                );
              }
              if (settings.name == OrderHotelScreen.routeName) {
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return OrderHotelScreen(
                      productId != null
                          ? ctx.read<HotelsManager>().findById(productId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },
          );
        }));
  }
}


// return MaterialApp(
//       title: 'MyShop',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         fontFamily: 'Lato',
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.deepOrange,
//         ).copyWith(secondary: Color.fromARGB(255, 252, 85, 34)),
//       ),
//       home: const SafeArea(child: HotelOverviewScreen()),
//       // home: HotelDetaiScreen(HotelsManager().items[0]),
//       // home: const SafeArea(child: UserHotelScreen())

//       routes: {UserHotelScreen.routeName: (ctx) => const UserHotelScreen()},
//       onGenerateRoute: (settings) {
//         if (settings.name == HotelDetaiScreen.routeName) {
//           final hotelID = settings.arguments as String;
//           return MaterialPageRoute(builder: (ctx) {
//             return HotelDetaiScreen(
//               ctx.read<HotelsManager>().findById(hotelID)!,
//             );
//           });
//         }
//         return null;
//       },
//     );