import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/dessert/item_dessert.dart';
import 'package:estructura_practica_1/models/product_dessert.dart';

import 'item_dessert_details.dart';

class DessertPage extends StatefulWidget {
  final List<ProductDessert> dessertList;
  final List<ProductItemCart> cartItems;
  DessertPage({
    Key key,
    @required this.dessertList,
    @required this.cartItems
  }) : super(key: key);

  @override
  _DessertPageState createState() => _DessertPageState();
}

class _DessertPageState extends State<DessertPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(productsList: widget.cartItems)));
            },
          )
        ],
        title: Text("Postres"),
      ),
      body: ListView.builder(
        itemCount: widget.dessertList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return DessertDetails(dessert: widget.dessertList[index], cartItems: widget.cartItems);
                    }
                  )
                ).then((value) => 
                  setState((){})
                );
              },
              child: ItemDessert(
              dessert: widget.dessertList[index],
            ),
          );
        },
      ),
    );
  }
}