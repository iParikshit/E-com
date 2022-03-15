import 'package:e_commerce/modal/products.dart';
import 'package:e_commerce/screens/Product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce/provider/cart.dart';

class ProductItemView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      header: Container(
        height: 30,
        child: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title),
        ),
      ),
      footer: Container(
        height: 35,
        child: GridTileBar(
          trailing: IconButton(
            onPressed: () {
              print('jnrj');
              cart.addItem(
                  product_id: product.id,
                  title: product.title,
                  price: product.price);
            },
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.green,
            ),
          ),
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              onPressed: () {
                product.toggleButton();
              },
              icon: product.isfavourite
                  ? Icon(Icons.favorite, color: Colors.red)
                  : Icon(Icons.favorite_outline_rounded),
            ),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.price.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      child: Container(
        color: Colors.grey,
        child: FittedBox(
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                    arguments: product.id);
              },
              child: Image.network(product.imageUrl)),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
