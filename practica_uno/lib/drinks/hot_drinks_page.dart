import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks_details.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/drinks/item_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_hot_drinks.dart';

class HotDrinksPage extends StatefulWidget {
  final List<ProductHotDrinks> drinksList;
  final List<ProductItemCart> cartItems;
  HotDrinksPage({
    Key key,
    @required this.drinksList,
    @required this.cartItems
  }) : super(key: key);

  @override
  _HotDrinksPageState createState() => _HotDrinksPageState();
}

class _HotDrinksPageState extends State<HotDrinksPage> {
  @override
  Widget build(BuildContext context) {
    ProductHotDrinks _drinkItem;
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
        title: Text("Bebidas"),
      ),
      body: ListView.builder(
        itemCount: widget.drinksList.length,
        itemBuilder: (BuildContext context, int index) {
          _drinkItem = widget.drinksList[index];
          return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return HotDrinkDetails(drink: widget.drinksList[index], cartItems: widget.cartItems,);
                    }
                  )
                ).then((value) => setState(() { }));
                
              },
              child: ItemHotDrinks(
                drink: _drinkItem,
            ),
          );
        },
      ),
    );
  }
}
