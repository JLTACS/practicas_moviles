import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/noticias_bloc.dart';
import 'noticia_deportes.dart';
import 'noticia_negocios.dart';

class Noticias extends StatefulWidget {
  Noticias({Key key}) : super(key: key);

  @override
  _NoticiasState createState() => _NoticiasState();
}

class _NoticiasState extends State<Noticias> {
  final _tabList = [
    Tab(icon: Icon(Icons.article), text: "Deportes"),
    Tab(icon: Icon(Icons.description), text: "Negocios"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Noticias"),
          bottom: TabBar(tabs: _tabList),
        ),
        body: BlocProvider(
          create: (context) => NoticiasBloc()..add(GetNewsEvent()),
          child: BlocConsumer<NoticiasBloc, NoticiasState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if(state is NoticiasSuccessState) {
                return TabBarView(children: [
                  NoticiaDeportes(noticias: state.noticiasSportList),
                  NoticiasNegocios(noticias: state.noticiasBusinessList,)
                ]);
              }
              return Center(child: Text("No hay noticias disponibles"));
              
              
            },
          ),
        ),
      ),
    );
  }
}