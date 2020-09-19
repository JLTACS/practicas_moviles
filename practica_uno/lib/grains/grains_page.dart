import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/grains/item_grains_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/grains/iten_grains.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class GrainsPage extends StatefulWidget {
  final List<ProductGrains> grainsList;
  final List<ProductItemCart> cartItems;
  GrainsPage({
    Key key,
    @required this.grainsList,
    @required this.cartItems
  }) : super(key: key);

  @override
  _GrainsPageState createState() => _GrainsPageState();
}

class _GrainsPageState extends State<GrainsPage> {
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
        title: Text("Café de grano"),
      ),
      body: ListView.builder(
        itemCount: widget.grainsList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return GrainsDetails(grains: widget.grainsList[index], cartItems: widget.cartItems,);
                    }
                  )
                ).then((value) => 
                  setState((){})
                );
            },
            child: ItemGrains(
              grains: widget.grainsList[index],
            ),
          );
        },
      ),
    );
  }
}