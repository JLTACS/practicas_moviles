import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/cart/item_cart.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';

class Cart extends StatefulWidget {
  final List<ProductItemCart> productsList;
  Cart({
    Key key,
    @required this.productsList,
  }) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double _total = 0;
  @override
  void initState() {
    super.initState();
    for (var item in widget.productsList) {
      _total += (item.productPrice * item.productAmount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Compras"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  itemCount: widget.productsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                        children: [
                          ItemCart(
                            onAmountUpdated: _priceUpdate,
                            product: widget.productsList[index],
                          ),
                          Positioned(
                            top: 30,
                            right: 30,
                            child: widget.productsList[index].product.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
                          ),
                          Positioned(
                            bottom: 12,
                            right: 18,
                            child: IconButton(
                              onPressed: () {
                                _priceUpdate(widget.productsList[index].productPrice * widget.productsList[index].productAmount * -1);
                                widget.productsList.removeAt(index);
                                setState(() {
                                  
                                });
                              },
                              icon: Icon(Icons.restore_from_trash)
                            )
                          )
                        ]
                    );
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 9.0, left: 12.0),
            child: Text("Total"),
          ),
          Padding(
            padding: const EdgeInsets.only( left: 12.0),
            child: Text("$_total MX\$", style: TextStyle(fontSize: 27)),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: RaisedButton(
              child: Text("PAGAR",
                style: TextStyle(fontSize: 12)
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PaymentPage())
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  void _priceUpdate(double newItemPrice) {
    setState(() {
      _total += newItemPrice;
    });
  }
}
