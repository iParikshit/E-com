import 'package:e_commerce/provider/product.dart';
import 'package:e_commerce/screens/cart_screen.dart';
import 'package:e_commerce/widgets/product_grid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/widgets/badge.dart';
import 'package:e_commerce/provider/cart.dart';

enum filterOptions {
  All,
  Favourite,
}

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
            builder: (context, cart, child) => Badge(
              child: child!,
              value: cart.item.length.toString(),
              color: Colors.red,
            ),
            child: IconButton(
              onPressed: () {
                print('hi');
                Navigator.pushNamed(context, CartScreen.cartScreen);
              },
              icon: const Icon(Icons.shopping_cart_rounded, size: 30),
            ),
          ),
          PopupMenuButton(
            onSelected: (filterOptions value) {
              // print(value.index);
              productList.filterProducts(value.name);
            },
            icon: const Icon(Icons.more_vert_sharp),
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                child: Text('All Items'),
                value: filterOptions.All,
              ),
              const PopupMenuItem(
                child: Text('Favourite'),
                value: filterOptions.Favourite,
              )
            ],
          ),
        ],
        title: const Text('Products'),
      ),
      body: ProductGrid(),
    );
  }
}
