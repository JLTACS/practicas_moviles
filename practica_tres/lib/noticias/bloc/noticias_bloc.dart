import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:noticias/models/noticia.dart';
import 'package:noticias/secrets.dart';

part 'noticias_event.dart';
part 'noticias_state.dart';

class NoticiasBloc extends Bloc<NoticiasEvent, NoticiasState> {
  final _sportsLink = "https://newsapi.org/v2/top-headlines?country=mx&category=sports&$apiKey";
  final _businessLink = "https://newsapi.org/v2/top-headlines?country=mx&category=business&$apiKey";
  NoticiasBloc() : super(NoticiasInitial());

  @override
  Stream<NoticiasState> mapEventToState(
    NoticiasEvent event,
  ) async* {
    if(event is GetNewsEvent) {
      
      // yield lista de noticias al estado
      try{
        List<Noticia> sportsNews = await _requestSportNoticias();
        List<Noticia> busNews = await _requestBusinessNoticias();
        yield NoticiasSuccessState(noticiasBusinessList: busNews, noticiasSportList: sportsNews);
      }catch(e){
        yield NoticiasErrorState(message: "Error encontrado al cargar noticias");
      }
    }
  }

  Future<List<Noticia>> _requestSportNoticias() async {
   
      Response response = await get(_sportsLink);
      
      List<Noticia> _noticiaList = List();

      if(response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)["articles"];
        _noticiaList = ((data).map((e) => Noticia.fromJson(e)).toList());
      }
      return _noticiaList;
  }

  Future<List<Noticia>> _requestBusinessNoticias() async {
   
      Response response = await get(_businessLink);
      
      List<Noticia> _noticiaList = List();

      if(response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body)["articles"];
        _noticiaList = ((data).map((e) => Noticia.fromJson(e)).toList());
        
       
      }
      return _noticiaList;
  }

  
}
