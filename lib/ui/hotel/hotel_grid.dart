import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/hotel/hotel_card.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:provider/provider.dart';

class HotelGrid extends StatelessWidget {
  final bool showFavorites;

  const HotelGrid(this.showFavorites, {super.key});

  @override
  Widget build(BuildContext context) {
    final productsManager = HotelsManager();
    final products = context.select<HotelsManager, List<Hotel>>(
        (productsManager) => productsManager.items);
    // showFavorites ? productsManager.favoriteItems : productsManager.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      itemCount: products.length,
      itemBuilder: (ctx, i) => HotelCard(products[i]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
