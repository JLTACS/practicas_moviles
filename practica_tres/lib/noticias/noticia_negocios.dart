import 'package:flutter/material.dart';
import 'package:noticias/models/noticia.dart';

import 'item_noticia.dart';

class NoticiasNegocios extends StatefulWidget {
  final List<Noticia> noticias;
  NoticiasNegocios({Key key, @required this.noticias}) : super(key: key);

  @override
  _NoticiasNegociosState createState() => _NoticiasNegociosState();
}

class _NoticiasNegociosState extends State<NoticiasNegocios> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: widget.noticias.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemNoticia(noticia: widget.noticias[index]);
          }
        )
    );
  }
}