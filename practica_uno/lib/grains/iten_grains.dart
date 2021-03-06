import 'package:flutter/material.dart';
import 'package:estructura_practica_1/models/product_grains.dart';

class ItemGrains extends StatefulWidget {
  final ProductGrains grains;
  ItemGrains({
    Key key,
    @required this.grains,
  }) : super(key: key);

  @override
  _ItemGrainsState createState() => _ItemGrainsState();
}

class _ItemGrainsState extends State<ItemGrains> {
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
                      Text("Café de grano",
                        style: TextStyle(fontSize: 15)
                      ),
                      Text("${widget.grains.productTitle}",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      Text("\$${widget.grains.productPrice}",
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
                    widget.grains.productImage, 
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 5,
            right: 30,
            child: Container(
              child: widget.grains.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
            ),
          )
        ]
      ),
    );
  }
}
