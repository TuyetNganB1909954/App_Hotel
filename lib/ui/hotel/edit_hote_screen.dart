import 'package:flutter/material.dart';
import 'package:myshop/models/hotel.dart';
import 'package:myshop/ui/hotel/hotel_manager.dart';
import 'package:provider/provider.dart';
import '../shared/dialog_utils.dart';

class EditHotelScreen extends StatefulWidget {
  static const routeName = '/edit-hotel';
  EditHotelScreen(
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
  State<EditHotelScreen> createState() => _EditHotelScreenState();
}

class _EditHotelScreenState extends State<EditHotelScreen> {
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
        title: const Text('Cập nhật khách sạn '),
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
                    buildPriceField(),
                    buildLocationField(),
                    buildDescriptionField(),
                    buildRatingField(),
                    buildProductPreview(),
                  ],
                ),
              ),
            ),
    );
  }

  TextFormField buildTitleField() {
    return TextFormField(
      initialValue: _editedProduct.hotelName,
      decoration: const InputDecoration(labelText: 'Tên khách sạn'),
      textInputAction: TextInputAction.next,
      autofocus: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'vui lòng nhập tên khách sạn';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(hotelName: value);
      },
    );
  }

  TextFormField buildPriceField() {
    return TextFormField(
      initialValue: _editedProduct.price.toString(),
      decoration: const InputDecoration(
          labelText: 'Giá', labelStyle: TextStyle(fontSize: 22)),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập giá trị';
        }
        if (double.parse(value) == null) {
          return 'Vui lòng nhập giá trị lớn hơn 0';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(price: double.parse(value!));
      },
    );
  }

  TextFormField buildDescriptionField() {
    return TextFormField(
      initialValue: _editedProduct.description,
      decoration: const InputDecoration(labelText: 'Mô tả'),
      // maxLines: 2,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập mô tả';
        }
        if (value.length < 10) {
          return 'Tối thiểu 10 kí tự';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(description: value);
      },
    );
  }

  TextFormField buildLocationField() {
    return TextFormField(
      initialValue: _editedProduct.location,
      decoration: const InputDecoration(labelText: 'Địa chỉ'),
      // maxLines: 3,
      keyboardType: TextInputType.multiline,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập địa chỉ';
        }
        if (value.length < 10) {
          return 'Tối thiểu 10 kí tự';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(description: value);
      },
    );
  }

  TextFormField buildRatingField() {
    return TextFormField(
      initialValue: _editedProduct.rating.toString(),
      decoration: const InputDecoration(
          labelText: 'Đánh giá', labelStyle: TextStyle(fontSize: 22)),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui lòng nhập giá trị';
        }
        if (double.parse(value) == null) {
          return 'Vui lòng nhập giá trị lớn hơn 0';
        }
        return null;
      },
      onSaved: (value) {
        _editedProduct = _editedProduct.copyWith(price: double.parse(value!));
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
