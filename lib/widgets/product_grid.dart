import 'package:e_commerce/provider/product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/modal/products.dart';
import 'package:e_commerce/screens/Product_item_view.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('full buid');
    final loadedProducts = Provider.of<Products>(context); // need context
    final products = loadedProducts.items;
    return GridView.builder(
      padding: EdgeInsets.all(7),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          childAspectRatio: 3 / 2.6,
          mainAxisSpacing: 8,
          crossAxisCount: 2),
      itemBuilder: (BuildContext context, index) =>
          ChangeNotifierProvider<Product>.value(
        value: products[index],
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: ProductItemView(),
        ),
      ),
    );
  }
}
