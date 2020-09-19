import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class ItemHotDrinks extends StatefulWidget {
  final ProductHotDrinks drink;
  ItemHotDrinks({
    Key key,
    @required this.drink,
  }) : super(key: key);

  @override
  _ItemHotDrinksState createState() => _ItemHotDrinksState();
}

class _ItemHotDrinksState extends State<ItemHotDrinks> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 4.0
                )
              ]
            ),
            child: Row(
              children: [
                Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Café",
                        style: TextStyle(fontSize: 15)
                      ),
                      Text("${widget.drink.productTitle}",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text("\$${widget.drink.productPrice}",
                        style: TextStyle(fontSize: 24)
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5.0),
                  width: 150,
                  height: 100,
                  child: Image.network(
                    widget.drink.productImage, 
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 30,
            child: Container(
              child: widget.drink.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
            ),
          )
        ]
      ),
    );
  }
}
