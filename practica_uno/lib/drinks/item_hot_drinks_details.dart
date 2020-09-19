import 'package:estructura_practica_1/models/product_hot_drinks.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';

class HotDrinkDetails extends StatefulWidget {
  final ProductHotDrinks drink;
  final List<ProductItemCart> cartItems;
  HotDrinkDetails({
    Key key,
    @required this.drink,
    @required this.cartItems
  }) : super(key: key);

  @override
  _HotDrinkDetailsState createState() => _HotDrinkDetailsState();
}

class _HotDrinkDetailsState extends State<HotDrinkDetails> {
  
  final List<String> _sizes = ["Chico", "Mediano", "Grande"];
  @override
  Widget build(BuildContext context) {
    int _size_selection = widget.drink.productSize.index;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.drink.productTitle),
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
                    child: Image.network(widget.drink.productImage),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          widget.drink.liked = !widget.drink.liked;
                        });
                      },
                      child: Container(
                        child: widget.drink.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
                      ),
                    ),
                  )
                ]
              ),
              SizedBox(height: 20),
              Text(widget.drink.productTitle, style: TextStyle(fontSize: 25),),
              SizedBox(height: 10),
              Text(widget.drink.productDescription, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("TAMAÑOS DISPONIBLES"),
                  Text("\$${widget.drink.productPrice}", style: TextStyle(fontSize: 30))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3,
                  (index) {
                    return ChoiceChip(
                      selectedColor: Colors.purple[50],
                      backgroundColor: Colors.grey[50],
                      shape: StadiumBorder(
                        side: _size_selection == index ? 
                                BorderSide(color:  Colors.purple)
                                : BorderSide.none
                      ),
                      selected: _size_selection == index ? true : false,
                      label: Text(_sizes[index]),
                      labelStyle: TextStyle(
                        color: _size_selection == index ? Colors.purple : Colors.grey
                      ),
                      onSelected: (selected) {
                        setState(() {
                          _size_selection = index;
                          widget.drink.productSize = ProductSize.values[index];
                          widget.drink.productPrice = widget.drink.productPriceCalculator();
                        });
                      },
                    );
                  }
                ),
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
                          productTitle: widget.drink.productTitle, 
                          productAmount: 1, 
                          productPrice: widget.drink.productPrice,
                          product: widget.drink,
                          productImage: widget.drink.productImage,
                          productSize: widget.drink.productSize.index,
                          typeOfProduct: ProductType.BEBIDAS
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