part of 'buscar_bloc.dart';

abstract class BuscarEvent extends Equatable {
  const BuscarEvent();

  @override
  List<Object> get props => [];
}

class GetFilteredNewsEvent extends BuscarEvent {
  final String textToFind;
  final bool findDeportes;
  final bool findNegocios;

  GetFilteredNewsEvent({@required this.textToFind, @required this.findDeportes, @required this.findNegocios});

  @override
  List<Object> get props => [textToFind, findDeportes, findNegocios];
}
