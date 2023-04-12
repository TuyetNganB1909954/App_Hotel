import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:provider/provider.dart';
import '../shared/dialog_utils.dart';

class OrderHotelScreen extends StatefulWidget {
  static const routeName = '/order-hotel';
  OrderHotelScreen(
    Hotel? hotel, {
    super.key,
  }) {
    if (hotel == null) {
      this.hotel = Hotel(
        id: null,
        hotelName: '',
        price: 0,
        description: '',
        imgUrl: '',
        location: '',
        rating: 0,
      );
    } else {
      this.hotel = hotel;
    }
  }
  late final Hotel hotel;
  @override
  State<OrderHotelScreen> createState() => _OrderHotelScreenState();
}

class _OrderHotelScreenState extends State<OrderHotelScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  final _editForm = GlobalKey<FormState>();
  late Hotel _editedProduct;
  var _isLoading = false;
  bool _isValidImageUrl(String value) {
    return (value.startsWith('http') || value.startsWith('https')) &&
        (value.endsWith('.png') ||
            value.endsWith('.jpg') ||
            value.endsWith('jpeg'));
  }

  @override
  void initState() {
    _imageUrlFocusNode.addListener(() {
      if (!_imageUrlFocusNode.hasFocus) {
        if (!_isValidImageUrl(_imageUrlController.text)) {
          return;
        }
        setState(() {});
      }
    });
    _editedProduct = widget.hotel;
    _imageUrlController.text = _editedProduct.imgUrl;
    super.initState();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _imageUrlFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    final isValid = _editForm.currentState!.validate();
    if (!isValid) {
      return;
    }
    _editForm.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    // try {
    //   final productsManager = context.read<ProductsManager>();
    //   if (_editedProduct.id != null) {
    //     productsManager.updateProduct(_editedProduct);
    //   } else {
    //     productsManager.addProduct(_editedProduct);
    //   }
    // } catch (error) {
    //   await showErrorDialog(context, 'Something went wrong');
    // }
    try {
      final productsManager = context.read<HotelsManager>();
      if (_editedProduct.id != null) {
        productsManager.updateProduct(_editedProduct);
      } else {
        productsManager.addProduct(_editedProduct);
      }
    } catch (error) {
      await showErrorDialog(context, 'Something went wrong');
    }

    setState(() {
      _isLoading = false;
    });
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt phòng khách sạn '),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _editForm,
                child: ListView(
                  children: <Widget>[
                    buildTitleField(),
                    buildAddressField(),
                    buildPhoneField()
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedProduct.hotelName,
      decoration: const InputDecoration(labelText: 'Họ và tên KH:'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'vui lòng nhập họ và tên khách đặt phòng';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(hotelName: value);
      },
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      initialValue: _editedProduct.hotelName,
      decoration: const InputDecoration(labelText: 'Địa chỉ:'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'vui lòng nhập địa chỉ';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(hotelName: value);
      },
    );
  }

  TextFormField buildPhoneField() {
    return TextFormField(
      initialValue: _editedProduct.hotelName,
      decoration: const InputDecoration(labelText: 'Số điện thoại:'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'vui lòng nhập số điện thoại';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(hotelName: value);
      },
    );
  }

  Widget buildProductPreview() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          width: 100,
          height: 100,
          margin: const EdgeInsets.only(
            top: 8,
            right: 10,
          ),
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          child: _imageUrlController.text.isEmpty
              ? const Text('Hình ảnh')
              : FittedBox(
                  child: Image.network(
                    _imageUrlController.text,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        Expanded(child: buildImageURLField())
      ],
    );
  }

  TextFormField buildImageURLField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Hình ảnh URL'),
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.done,
      controller: _imageUrlController,
      focusNode: _imageUrlFocusNode,
      onFieldSubmitted: (value) => _saveForm(),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập hình ảnh URL';
        }
        if (!_isValidImageUrl(value)) {
          return 'Vui lòng nhập hình ảnh URL hợp lệ';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(imgUrl: value);
      },
    );
  }
}
