import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';

class UserHotelListTile extends StatelessWidget {
  final Hotel hotel;

  const UserHotelListTile(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(hotel.hotelName),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(hotel.imgUrl),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            buildEditButton(context),
            buildDeleteButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildDeleteButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        print('Delete a hotel');
      },
      color: Theme.of(context).colorScheme.error,
    );
    // return IconButton(
    //   icon: const Icon(Icons.delete),
    //   onPressed: () {
    //     context.read<HotelsManager>().deleteProduct(hotel.id!);
    //     ScaffoldMessenger.of(context)
    //       ..hideCurrentSnackBar()
    //       ..showSnackBar(
    //         const SnackBar(
    //           content: Text(
    //             'Product deleted',
    //             textAlign: TextAlign.center,
    //           ),
    //         ),
    //       );
    //   },
    //   color: Theme.of(context).colorScheme.error,
    // );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        print('Go to edit hotel screen');
        // Navigator.of(context).pushNamed(
        //   EditProductScreen.routeName,
        //   arguments: hotel.id,
        // );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
