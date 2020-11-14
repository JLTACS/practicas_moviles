import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/buscar/bloc/buscar_bloc.dart';
import 'package:noticias/buscar/noticias_buscar.dart';

class Buscar extends StatefulWidget {
  Buscar({
    Key key
  }): super(key: key);

  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State < Buscar > {
  bool _deportesSelected = false;
  bool _negociosSelected = false;
  TextEditingController _buscarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Noticias")
      ),
      body: BlocProvider(
        create: (context) => BuscarBloc(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
            child: BlocConsumer < BuscarBloc, BuscarState > (
              listener: (context, state) {
                if(state is BuscarErrorState){
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Ups... parece que algo salio mal"),)
                    );
                }
              },
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (string){
                          BlocProvider.of<BuscarBloc>(context).add(GetFilteredNewsEvent(
                            findDeportes: _deportesSelected,
                            findNegocios: _negociosSelected,
                            textToFind: _buscarController.text
                          ));
                        },
                        controller: _buscarController,
                        decoration: InputDecoration(
                          hintText: "Buscar",
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4.0))
                          )
                        ),
                      ),
                      Row(
                        children: [
                          FilterChip(
                            label: Text("Deportes"),
                            selected: _deportesSelected,
                            onSelected: (select) {
                              _deportesSelected = select;
                              BlocProvider.of<BuscarBloc>(context).add(GetFilteredNewsEvent(
                                findDeportes: _deportesSelected,
                                findNegocios: _negociosSelected,
                                textToFind: _buscarController.text
                              ));
                              setState(() {
                                
                              });
                            },
                          ),
                          SizedBox(
                            width: 10
                          ),
                          FilterChip(
                            label: Text("Negocios"),
                            selected: _negociosSelected,
                            onSelected: (select) {
                              _negociosSelected = select;
                              BlocProvider.of<BuscarBloc>(context).add(GetFilteredNewsEvent(
                                findDeportes: _deportesSelected,
                                findNegocios: _negociosSelected,
                                textToFind: _buscarController.text
                              ));
                              setState(() {
                                
                              });
                            },
                          ),
                          
                          
                          

                        ],
                      ),
                      if(state is BuscarSuccesState) 
                          
                          NoticiaBuscar(noticias: state.noticiasList)
                    ]
                  ),
                );
              },

            ),
        )
      )
    );
  }
}