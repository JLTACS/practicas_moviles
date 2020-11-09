part of 'misnoticias_bloc.dart';

abstract class MisnoticiasEvent extends Equatable {
  const MisnoticiasEvent();

  @override
  List<Object> get props => [];
}

class CrearNoticiaEvent extends MisnoticiasEvent{
  final String titulo;
  final String descripcion;
  final String autor;
  final String fuente;

  CrearNoticiaEvent({
    @required this.titulo, @required this.descripcion,  @required this.autor, @required this.fuente
  });
  @override
  List<Object> get props => [titulo, descripcion, autor, fuente];
}

class LeerNoticiaEvent extends MisnoticiasEvent{
  @override
  List<Object> get props => [];
}

class CargarImagenEvent extends MisnoticiasEvent{
  final bool takePictureFromCamera;

  CargarImagenEvent({@required this.takePictureFromCamera});
  @override
  List<Object> get props => [takePictureFromCamera];
}
