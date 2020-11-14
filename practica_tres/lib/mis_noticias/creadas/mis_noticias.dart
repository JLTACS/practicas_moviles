import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/mis_noticias/bloc/misnoticias_bloc.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/noticias/item_noticia.dart';
import 'package:noticias/models/source.dart' as ModelSource;

class MisNoticias extends StatefulWidget {
  
  MisNoticias({Key key}) : super(key: key);

  @override
  _MisNoticiasState createState() => _MisNoticiasState();
}

class _MisNoticiasState extends State<MisNoticias> {
  List<dynamic> _noticias;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Noticias"),
        ),
        body: BlocProvider(
          create: (context) => MisnoticiasBloc()..add(LeerNoticiaEvent()),
          child: BlocConsumer<MisnoticiasBloc, MisnoticiasState>(
            listener: (context, state) {
              if(state is NoticiasErrorState){
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Ups... parece que algo salio mal"),)
                );
              }
            },
            builder: (context, state) {
              if(state is NoticiasDescargadasState) {
                return StreamBuilder(
                  stream: state.misNoticiasStream,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return CircularProgressIndicator();
                    _noticias = snapshot.data.documents
                      .map(
                        (elemento) { 
                          ModelSource.Source newSource = ModelSource.Source(
                            id: elemento["fuente"],
                            name: elemento["fuente"]
                          );
                          return Noticia(
                            title: elemento["titulo"],
                            description: elemento["descripcion"],
                            author: elemento["autor"],
                            source: newSource,
                            urlToImage: elemento["imagen"],
                            publishedAt: elemento["fecha"],
                          );
                        }
                      )
                      .toList();
                    
                    return ListView.builder(
                      itemCount: _noticias.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ItemNoticia(noticia: _noticias[index]);
                      }
                );
                  }
                );
                // _noticias = state.misNoticiasList;
                // return ListView.builder(
                //   itemCount: _noticias.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return ItemNoticia(noticia: _noticias[index]);
                //   }
                // );
              }
              return Center(child: Text("No hay noticias disponibles"));
              
              
            },
          ),
        ),
    );
  }
}