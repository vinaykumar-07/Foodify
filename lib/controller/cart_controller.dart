import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../models/cart_model.dart';
import '../models/products_model.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
     _items.putIfAbsent(product.id!, () {
      print("add item to the cart");
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        isExist: true,
        time: DateTime.now().toString(),
        quantity: quantity,
      );
    });
  }
}
