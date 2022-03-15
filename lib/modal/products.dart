import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  late final String id;
  late final String title;
  late final double price;
  late final String description;
  bool isfavourite;
  late final String imageUrl;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imageUrl,
      this.isfavourite = false});

  toggleButton() {
    isfavourite = !isfavourite;
    notifyListeners();
  }
}
