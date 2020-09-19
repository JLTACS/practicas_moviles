import 'package:estructura_practica_1/payment/item_payment.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pagos"),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text("Elige tu método de pago:",
              style: TextStyle(fontSize: 22)
            ),
            ItemPayment(
              title: "Tarjeta de crédito", 
              icon: Icon(
                Icons.credit_card, 
                size: 80,
                color: Theme.of(context).primaryColor,
              )
            ),
            ItemPayment(
              title: "PayPal", 
              icon: Image.asset(
                "images/paypal.png",
                height: 80,
              )
            ),
            ItemPayment(
              title: "Tarjeta de regalo", 
              icon: Icon(
                Icons.card_giftcard,
                size: 80,
                color: Theme.of(context).primaryColor,
              )
            )
          ],
        ),
      ),
    );
  }
}