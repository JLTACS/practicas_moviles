import 'package:estructura_practica_1/models/product_grains.dart';
import 'package:estructura_practica_1/models/product_item_cart.dart';
import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:estructura_practica_1/payment/payment.dart';
import 'package:flutter/material.dart';

class GrainsDetails extends StatefulWidget {
  final ProductGrains grains;
  final List<ProductItemCart> cartItems;
  GrainsDetails({
    Key key,
    @required this.grains,
    @required this.cartItems
  }) : super(key: key);

  @override
  _GrainsDetailsState createState() => _GrainsDetailsState();
}

class _GrainsDetailsState extends State<GrainsDetails> {
  
  final List<String> _sizes = ["250 G", "1K"];
  @override
  Widget build(BuildContext context) {
    int _size_selection = widget.grains.productWeight.index;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(widget.grains.productTitle),
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
                    child: Image.network(widget.grains.productImage),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          widget.grains.liked = !widget.grains.liked;
                        });
                      },
                      child: Container(
                        child: widget.grains.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
                      ),
                    ),
                  )
                ]
              ),
              SizedBox(height: 20),
              Text(widget.grains.productTitle, style: TextStyle(fontSize: 25),),
              SizedBox(height: 10),
              Text(widget.grains.productDescription, style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("TAMAÑOS DISPONIBLES"),
                  Text("\$${widget.grains.productPrice}", style: TextStyle(fontSize: 30))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2,
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
                          widget.grains.productWeight = ProductWeight.values[index];
                          widget.grains.productPrice = widget.grains.productPriceCalculator();
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
                          productTitle: widget.grains.productTitle, 
                          productAmount: 1, 
                          productPrice: widget.grains.productPrice,
                          product: widget.grains,
                          productImage: widget.grains.productImage,
                          productSize: widget.grains.productWeight.index,
                          typeOfProduct: ProductType.GRANO
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