import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final double price;
  final int quantity;
  final String title;
  CartItem(
      {required this.price,
      required this.id,
      required this.quantity,
      required this.title});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    // "r": CartItem(price: 44, id: "e", quantity: 4, title: "title")
  };
  Map<String, CartItem> get item {
    return {..._items}; // ...spread opertor to pull out _items
  }

  void addItem({var product_id, var title, var price}) {
    if (_items.containsKey(product_id)) {
      _items.update(
          product_id,
          (value) => CartItem(
              price: value.price,
              id: value.id,
              quantity: value.quantity + 1,
              title: value.title));
      print('ji');
    } else {
      _items.putIfAbsent(
          product_id,
          () => CartItem(
              price: price,
              id: DateTime.now().toString(),
              quantity: 1,
              title: title));
      print('ni');
    }
    notifyListeners();
    print(item);
  }
}
