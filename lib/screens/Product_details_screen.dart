import 'package:e_commerce/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = 'ProductDetailsScreen';
  @override
  Widget build(BuildContext context) {
    final productID = ModalRoute.of(context)?.settings.arguments as String;
    // print('prod_id :$productID');

    final loadedProducts = Provider.of<Products>(context).findByID(productID);
    // print('loaded product : $loadedProducts');
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
    );
  }
}
