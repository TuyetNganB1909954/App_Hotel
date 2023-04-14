import 'package:flutter/material.dart';
import 'package:myshop/ui/hotel/edit_hote_screen.dart';
import 'package:myshop/ui/hotel/user_hotel_tile.dart';
import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';

class UserHotelScreen extends StatelessWidget {
  static const routeName = '/user-hotels';
  const UserHotelScreen({super.key});

  Future<void> _refreshHotels(BuildContext context) async {
    await context.read<HotelsManager>().fetchHotels();
  }

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
        drawer: const AppDrawer(),
        body: FutureBuilder(
          future: _refreshHotels(context),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return RefreshIndicator(
                child: buildUserProductListView(hotelsManager),
                onRefresh: () => _refreshHotels(context));
          },
        ));
  }

  Widget buildUserProductListView(HotelsManager hotelsManager) {
    return Consumer<HotelsManager>(builder: (ctx, hotelsManager, child) {
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
    });
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
