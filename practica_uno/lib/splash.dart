import 'dart:async';

import 'package:estructura_practica_1/begin.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => BeginPage())
      );
    });
    return Container(
      child: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/coffee.jpg'),
              fit: BoxFit.cover 
            ),
          ),
          child: Image.asset('images/cupping.png')
        ),
      ),
    );
  }
}