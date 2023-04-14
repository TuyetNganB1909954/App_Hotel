import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/hotel/edit_hote_screen.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:provider/provider.dart';

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
        context.read<HotelsManager>().deleteHotel(hotel.id!);
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text(
                'Xóa khách sạn thành công',
                textAlign: TextAlign.center,
              ),
            ),
          );
      },
      color: Theme.of(context).colorScheme.error,
    );
  }

  Widget buildEditButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        // print('Go to edit product screen');
        Navigator.of(context).pushNamed(
          EditHotelScreen.routeName,
          arguments: hotel.id,
        );
      },
      color: Theme.of(context).primaryColor,
    );
  }
}
