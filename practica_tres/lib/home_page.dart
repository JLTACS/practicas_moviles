import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'buscar/buscar.dart';
import 'mis_noticias/creadas/mis_noticias.dart';
import 'mis_noticias/nuevo/crear_noticia.dart';
import 'noticias/noticias.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  final _pagesList = [
    Noticias(),
    Buscar(),
    MisNoticias(),
    CreaarNoticia()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentPageIndex,
        children: _pagesList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black38,
        selectedItemColor: Colors.indigo,
        currentIndex: _currentPageIndex,
        onTap: (index){
          setState(() {
            _currentPageIndex = index;
            
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.class_), label: "Noticias"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.bookmarks), label: "Mis Noticias"),
          BottomNavigationBarItem(icon: Icon(Icons.subject), label: "Agregar Nueva")
        ],
      ),
    );
  }
}
