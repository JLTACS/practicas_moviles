import 'package:flutter/material.dart';

class CreaarNoticia extends StatefulWidget {
  CreaarNoticia({Key key}) : super(key: key);

  @override
  _CreaarNoticiaState createState() => _CreaarNoticiaState();
}

class _CreaarNoticiaState extends State<CreaarNoticia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Crear Noticias"),)
    );
  }
}