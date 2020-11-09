import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/noticias/item_noticia.dart';

class NoticiaBuscar extends StatefulWidget {
  final List<Noticia> noticias;
  const NoticiaBuscar({Key key, @required this.noticias}) : super(key: key);

  @override
  _NoticiaBuscarState createState() => _NoticiaBuscarState();
}

class _NoticiaBuscarState extends State<NoticiaBuscar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 400,
      child: ListView.builder(
            itemCount: widget.noticias.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemNoticia(noticia: widget.noticias[index]);
            }
          ),
    );
    
  }
}