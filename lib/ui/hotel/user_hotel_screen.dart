import 'package:flutter/material.dart';
import 'package:myshop/ui/hotel/edit_hote_screen.dart';
import 'package:myshop/ui/hotel/user_hotel_tile.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

class UserHotelScreen extends StatelessWidget {
  static const routeName = '/user-hotel';
  const UserHotelScreen({super.key});

  // Future<void> _refreshProducts(BuildContext context) async {
  //   await context.read<HotelsManager>().fetchProducts(true);
  // }

  @override
  Widget build(BuildContext context) {
    final hotelsManager = HotelsManager();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý khách sạn'),
          actions: <Widget>[
            buildAddButton(context),
          ],
        ),
        // drawer: const AppDrawer(),
        body: RefreshIndicator(
          onRefresh: () async => print('refresh products'),
          child: buildUserProductListView(hotelsManager),
        )
        //   body: FutureBuilder(
        //     future: _refreshProducts(context),
        //     builder: (ctx, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(),
        //         );
        //       }
        //       return RefreshIndicator(
        //           child: buildUserProductListView(HotelsManager),
        //           onRefresh: () => _refreshProducts(context));
        //     },
        //   ),
        );
  }

  Widget buildUserProductListView(HotelsManager hotelsManager) {
    // return Consumer<HotelsManager>(builder: (ctx, HotelsManager, child) {
    //   return ListView.builder(
    //     itemCount: HotelsManager.itemsCount,
    //     itemBuilder: (ctx, i) => Column(
    //       children: [
    //         UserProductListTile(
    //           HotelsManager.items[i],
    //         ),
    //         const Divider(),
    //       ],
    //     ),
    //   );
    // });
    return ListView.builder(
      itemCount: hotelsManager.itemsCount,
      itemBuilder: (ctx, i) => Column(
        children: [
          UserHotelListTile(
            hotelsManager.items[i],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget buildAddButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add),
      onPressed: () {
        // print('Go to edit product screen');
        Navigator.of(context).pushNamed(
          EditHotelScreen.routeName,
        );
      },
    );
  }
}
