import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noticias/models/noticia.dart';
import 'package:path/path.dart' as Path;

part 'misnoticias_event.dart';
part 'misnoticias_state.dart';

class MisnoticiasBloc extends Bloc<MisnoticiasEvent, MisnoticiasState> {
    List<DocumentSnapshot> _documentsList;
    List<Noticia> _noticiaList;
    List<Noticia> get getNoticiasList => _noticiaList;
    File chosenImage;
  MisnoticiasBloc() : super(MisnoticiasInitial());

  @override
  Stream<MisnoticiasState> mapEventToState(
    MisnoticiasEvent event,
  ) async* {
    if(event is LeerNoticiaEvent) {
      try{
        await _getAllNoticias();
        yield NoticiasDescargadasState();
      }catch(e) {
        yield NoticiasErrorState(errorMessage: "No se pudo descargar");
      }

    } else if(event is CargarImagenEvent){
      chosenImage = await _chooseImage(event.takePictureFromCamera);
      yield ImagenCargadaState(imagen: chosenImage);

    } else if(event is CrearNoticiaEvent){
      try {
        String urlImage = await _uploadPicture(chosenImage);
        await _saveNoticia(event.titulo, event.descripcion, event.autor, event.fuente, urlImage);
        yield NoticiasCreadaState();
      }catch(e){
        yield NoticiasErrorState(errorMessage: "No se pudo guardar");
      }
    }
  }

  Future<File> _chooseImage(bool fromCamera) async {
    final picker = ImagePicker();
    final PickedFile chooseImage = await picker.getImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
      maxHeight: 720,
      maxWidth: 720,
      imageQuality: 85,
    );
    return File(chooseImage.path);
  }

  Future<String> _uploadPicture(File image) async {
    String imagePath = image.path;
    // referencia al storage de firebase
    StorageReference reference = FirebaseStorage.instance
        .ref()
        .child("noticias/${Path.basename(imagePath)}");

    // subir el archivo a firebase
    StorageUploadTask uploadTask = reference.putFile(image);
    await uploadTask.onComplete;

    // recuperar la url del archivo que acabamos de subir
    dynamic imageURL = await reference.getDownloadURL();
    return imageURL;
  }

  Future _saveNoticia(
    String titulo,
    String descripcion,
    String autor,
    String fuente,
    String imageUrl
  ) async {
    // Crea un doc en la collection de apuntes

    await FirebaseFirestore.instance.collection("noticias").doc().set({
      "titulo": titulo,
      "descripcion": descripcion,
      "autor": autor,
      "fuente": fuente,
      "imagen": imageUrl,
      "fecha" : DateTime.now().toString(),
    });

    
  }

   Future _getAllNoticias() async {
    // recuperar lista de docs guardados en Cloud firestore
    // mapear a objeto de dart (Apunte)
    // agregar cada ojeto a una lista
    var misNoticias = await FirebaseFirestore.instance.collection("noticias").get();
    _documentsList = misNoticias.docs;

    _noticiaList = misNoticias.docs
        .map(
          (elemento) => Noticia(
            title: elemento["titulo"],
            description: elemento["descripcion"],
            author: elemento["autor"],
            source: elemento["fuente"],
            urlToImage: elemento["imagen"],
            publishedAt: elemento["fecha"]
          ),
        )
        .toList();
  }

}


