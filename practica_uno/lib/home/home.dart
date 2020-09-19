import 'package:estructura_practica_1/cart/cart.dart';
import 'package:estructura_practica_1/dessert/dessert_page.dart';
import 'package:estructura_practica_1/drinks/hot_drinks_page.dart';
import 'package:estructura_practica_1/grains/grains_page.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/home/item_home.dart';
import 'package:estructura_practica_1/utils/constants.dart';

import '../begin.dart';

class Home extends StatefulWidget {
  final String title;

  Home({Key key, this.title}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var drinkList = ProductRepository.loadProducts(ProductType.BEBIDAS);
  var grainsList = ProductRepository.loadProducts(ProductType.GRANO);
  var dessertList = ProductRepository.loadProducts(ProductType.POSTRES);
  List<ProductItemCart> cartItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 230,
              child: DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        PROFILE_PICTURE,
                      ),
                      minRadius: 20,
                      maxRadius: 60,
                    ),
                    SizedBox(height: 12),
                    Text(PROFILE_NAME, 
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    ),
                    Text(PROFILE_EMAIL,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white
                      ),
                    )
                  ]
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(productsList: cartItems)));
              },
                child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text("LISTA DE COMPRAS")
              ),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("LISTA DE DESEOS")
            ),
            ListTile(
              leading: Icon(Icons.store),
              title: Text("HISTORIAL DE COMPRAS")
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("CONFIGURACION")
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text("CERRAR SESIÓN",
                    style: TextStyle(fontSize: 12)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => BeginPage()));
                  } 
                ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart(productsList: cartItems)));
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: _openHotDrinksPage,
            child: ItemHome(
              title: "Bebidas calientes",
              image: "https://i.imgur.com/XJ0y9qs.png",
            ),
          ),
          GestureDetector(
            onTap: _openGrainsPage,
            child: ItemHome(
              title: "Granos",
              image: "https://i.imgur.com/5MZocC1.png",
            ),
          ),
          GestureDetector(
            onTap: _openDessertPage,
            child: ItemHome(
              title: "Postres",
              image: "https://i.imgur.com/fI7Tezv.png",
            ),
          ),
          GestureDetector(
            onTap: () {
              _scaffoldKey.currentState
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text('Proximamente'),
                )
              );
              setState(() {
                
              });
            },
            child: ItemHome(
              title: "Tazas",
              image: "https://i.imgur.com/fMjtSpy.png",
            ),
          ),
        ],
      ),
    );
  }

  void _openHotDrinksPage() {   

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return HotDrinksPage(drinksList: drinkList, cartItems: cartItems,);
        },
      ),
    );
  }

  void _openGrainsPage() {
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return GrainsPage(grainsList: grainsList, cartItems: cartItems,);
        }
      ),
    );
  }

  void _openDessertPage() {

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DessertPage(dessertList: dessertList, cartItems: cartItems);
        }
      ),
    );
  }
}
