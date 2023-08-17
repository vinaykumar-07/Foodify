import 'package:example1/controller/cart_controller.dart';
import 'package:example1/data/repository/popular_product_repo.dart';
import 'package:example1/models/cart_model.dart';
import 'package:example1/models/products_model.dart';
import 'package:example1/utilites/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItem = 0;
  int get inCartItem => _inCartItem + quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      // print('${response.statusCode}');
      // print('got products');
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      // print(_popularProductList);
      _isLoaded = true;
      update();
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      // print("number of items " + _quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      // print('decrement ' + _quantity.toString());
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  checkQuantity(int quantity) {
    if ((inCartItem + quantity) < 0) {
      Get.snackbar('Item Count', "you can't reduce more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (_inCartItem > 0) {
        _quantity = -_inCartItem;
        return _quantity;
      }
      return 0;
    } else if ((inCartItem + quantity) > 20) {
      Get.snackbar(
        'Item Count',
        "you can't add more",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItem = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print(" exist or not  ${ exist.toString()}");
    if (exist) {
      _inCartItem = _cart.getQuantity(product);
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItem = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      // print("the id is ${value.id.toString()}  the quantity is ${value.quantity.toString()}");
    });

    update();
  }

  int get totelItem {
    return _cart.totalItems;
  }

  List<CartModel> get getitems {
    return _cart.getItems;
  }
}
