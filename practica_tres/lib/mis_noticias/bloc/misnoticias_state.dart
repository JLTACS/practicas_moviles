part of 'misnoticias_bloc.dart';

abstract class MisnoticiasState extends Equatable {
  const MisnoticiasState();
  
  @override
  List<Object> get props => [];
}

class MisnoticiasInitial extends MisnoticiasState {}
class NoticiasDescargadasState extends MisnoticiasState {
  final Stream<QuerySnapshot> misNoticiasStream;

  NoticiasDescargadasState({@required this.misNoticiasStream});

  @override
  List<Object> get props => [misNoticiasStream];
}

class NoticiasErrorState extends MisnoticiasState {
  final String errorMessage;

  NoticiasErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class NoticiasCreadaState extends MisnoticiasState {}

class ImagenCargadaState extends MisnoticiasState {
  final File imagen;

  ImagenCargadaState({@required this.imagen});

  @override
  List<Object> get props => [imagen];
}
