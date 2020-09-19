import 'package:flutter/foundation.dart';
import 'package:estructura_practica_1/models/product_repository.dart';

class ProductItemCart {
  String productTitle;
  int productAmount;
  double productPrice;
  String productImage;
  int productSize;
  dynamic product;
  final ProductType typeOfProduct;

  ProductItemCart({
    this.typeOfProduct,
    @required this.productTitle,
    @required this.productAmount,
    @required this.productPrice,
    this.productSize,
    @required this.productImage,
    @required this.product
  });
}
