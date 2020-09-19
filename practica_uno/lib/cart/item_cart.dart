import 'package:estructura_practica_1/models/product_repository.dart';
import 'package:flutter/material.dart';

class ItemCart extends StatefulWidget {
  final dynamic product;
  final ValueChanged<double> onAmountUpdated;
  ItemCart({
    Key key,
    @required this.onAmountUpdated,
    @required this.product,
  }) : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(12),
      color: Color(0xFFFABF7C),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            SizedBox(
              width: 12,
            ),
            Image.network(widget.product.productImage, height: 140, width: 100,),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 100,
                      child: Text("${widget.product.productTitle}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    //widget.product.product.liked ? Icon(Icons.favorite) : Icon(Icons.favorite_border)
                  ],
                ),
                SizedBox(height: 8),
                Text(_checkSize(), style: TextStyle(color: Colors.white, fontSize: 15),),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(icon: Icon(Icons.add_circle_outline), onPressed: _addProd),
                    Text("${widget.product.productAmount}", style: TextStyle(fontSize: 24)),
                    IconButton(icon: Icon(Icons.remove_circle_outline), onPressed: _remProd),
                    Text("\$${widget.product.productPrice}", style: TextStyle(fontSize: 18)),
                  ]
                )
              ]
            ),
            
            SizedBox(
              height: 12,
            ),
            
            SizedBox(
              height: 12,
            ),
            
            SizedBox(
              height: 12,
            ),
            
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  void _addProd() {
    setState(() {
      ++widget.product.productAmount;
    });
    widget.onAmountUpdated(widget.product.productPrice);
  }

  void _remProd() {
    setState(() {
      --widget.product.productAmount;
    });
    widget.onAmountUpdated(-1 * widget.product.productPrice);
  }

  String _checkSize() {
    if(widget.product.typeOfProduct == ProductType.BEBIDAS){
      switch (widget.product.productSize) {
        case 0: return "Tamaño Chico";break;
        case 1: return "Tamaño Mediano";break;
        case 2: return "Tamaño Grande"; break;
        default: return "";
      }
    }else if(widget.product.typeOfProduct == ProductType.GRANO){
      switch (widget.product.productSize) {
        case 0: return "Peso 250G";break;
        case 1: return "Peso 1K";break;
        default: return "";
      }
    }else{
      return "";
    }
  }
}
