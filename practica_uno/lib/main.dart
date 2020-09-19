import 'package:estructura_practica_1/begin.dart';
import 'package:estructura_practica_1/splash.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData base = ThemeData.light();
    return MaterialApp(
      title: APP_TITLE,
      theme: ThemeData(
        primaryColor: Color(0xFF214254),
        //canvasColor: Color(0xFFFFFFFF),
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        accentColor: Color(0xFFBCB0A1),
        buttonTheme: base.buttonTheme.copyWith(
          buttonColor: Colors.grey[500],
          disabledColor: Color(0xFF214254),
          padding: const EdgeInsets.all(15.0),
        ),
        unselectedWidgetColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.white, width:1.0)
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.0),
            borderSide: BorderSide(color: Colors.white, width:1.0)
          ),
          contentPadding: const EdgeInsets.only(left: 10, right: 10)
        ),
        fontFamily: 'AkzidenzGrotesk'
      ),
      home: SplashPage(),
    );
      
    
  }
}


