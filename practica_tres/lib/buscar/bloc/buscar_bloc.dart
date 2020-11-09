import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/secrets.dart';

part 'buscar_event.dart';
part 'buscar_state.dart';

class BuscarBloc extends Bloc<BuscarEvent, BuscarState> {
  final _sportsLink = "https://newsapi.org/v2/top-headlines?country=mx&category=sports&$apiKey";
  final _businessLink = "https://newsapi.org/v2/top-headlines?country=mx&category=business&$apiKey";
  BuscarBloc() : super(BuscarInitial());

  @override
  Stream<BuscarState> mapEventToState(
    BuscarEvent event,
  ) async* {
    if(event is GetFilteredNewsEvent){
      try{
        List<Noticia> news = await _requestNoticias(
          event.textToFind, event.findDeportes, event.findNegocios);
        print(news);
        yield BuscarSuccesState(noticiasList: news);
      }catch(e){
        yield BuscarErrorState(message: "Error al buscar noticias");
      }
    }
  }

  Future<List<Noticia>> _requestNoticias(
    String textToFind,
    bool deportes,
    bool negocios
  ) async {
    List<Noticia> _noticiaList = List();
    if(textToFind == ''){
      return _noticiaList;
    }

    if(deportes) {
      Response responseDeportes = await get(_sportsLink);
      if(responseDeportes.statusCode == 200) {
        List<dynamic> data = jsonDecode(responseDeportes.body)["articles"];
          (data).map((e) => Noticia.fromJson(e)).toList().forEach((element) {
            _noticiaList.add(element);
          });
      }
    }

    if(negocios) {
      Response responseNegocios = await get(_businessLink);
      if(responseNegocios.statusCode == 200) {
        List<dynamic> data = jsonDecode(responseNegocios.body)["articles"];
          (data).map((e) => Noticia.fromJson(e)).toList().forEach((element) {
            _noticiaList.add(element);
          });
      }
    }

    _noticiaList.retainWhere((element) => element.title.toLowerCase().contains(textToFind.toLowerCase()));
    return _noticiaList;
  }
}
