import 'package:estructura_practica_1/models/product_dessert.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';

class DessertDetails extends StatefulWidget {
  final ProductDessert dessert;
  final List<ProductItemCart> cartItems;
  DessertDetails({
    Key key,
    @required this.dessert,
    @required this.cartItems
  }) : super(key: key);

  @override
  _DessertDetailsState createState() => _DessertDetailsState();
}

class _DessertDetailsState extends State<DessertDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.dessert.productTitle),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 50,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Color(0xFFFABF7C),
                    width: 300,
                    height: 300,
                  ),
                  Container(
                    width: 250,
                    height: 250,
                    child: Image.network(widget.dessert.productImage),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          widget.dessert.liked = !widget.dessert.liked;
                        });
                      },
                      child: Container(
                        child: widget.dessert.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
                      ),
                    ),
                  )
                ]
              ),
              SizedBox(height: 20),
              Text(widget.dessert.productTitle, style: TextStyle(fontSize: 25),),
              SizedBox(height: 10),
              Text(widget.dessert.productDescription, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("            "),
                  Text("\$${widget.dessert.productPrice}", style: TextStyle(fontSize: 30))
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    child: Text("AGREGAR AL CARRITO",
                      style: TextStyle(fontSize: 12, color: Colors.white)
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      widget.cartItems.add(
                        ProductItemCart(
                          productTitle: widget.dessert.productTitle, 
                          productAmount: 1, 
                          productPrice: widget.dessert.productPrice,
                          product: widget.dessert,
                          productImage: widget.dessert.productImage,
                          typeOfProduct: ProductType.POSTRES
                        )
                      );
                    }
                  ),
                  RaisedButton(
                    child: Text("COMPRAR AHORA",
                      style: TextStyle(fontSize: 12, color: Colors.white)
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
                ]
                
              )
            ]
          ),
      )

    );
  }
}