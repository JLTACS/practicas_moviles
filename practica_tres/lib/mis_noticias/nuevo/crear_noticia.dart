import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noticias/mis_noticias/bloc/misnoticias_bloc.dart';

class CreaarNoticia extends StatefulWidget {
  CreaarNoticia({Key key}) : super(key: key);

  @override
  _CreaarNoticiaState createState() => _CreaarNoticiaState();
}

class _CreaarNoticiaState extends State<CreaarNoticia> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crear Noticias")
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocProvider(
            create: (context) => MisnoticiasBloc(),
            child: BlocConsumer<MisnoticiasBloc, MisnoticiasState>(
                listener: (context, state){
                  if(state is NoticiasCreadaState){
                    _titleController.text = "";
                    _authorController.text = "";
                    _descriptionController.text = "";
                  }else if(state is NoticiasErrorState){
                    Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Ups... parece que algo salio mal"),)
                    );
                  }
                },
                builder: (context, state){  
                return SingleChildScrollView(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 150,
                          alignment: Alignment(0.0, 0.0),
                          child: (state is ImagenCargadaState) ? 
                            Image.file(
                              state.imagen,
                              fit: BoxFit.cover,
                            )
                          : Text("Insertar Imagen")
                        ),
                        Positioned(
                          bottom: 5,
                          right: 5,
                          child: FloatingActionButton(
                            backgroundColor: Colors.black,
                            mini: true,
                            onPressed: (){
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc){
                                    return Container(
                                      child: new Wrap(
                                      children: <Widget>[
                                        new ListTile(
                                          leading: Icon(Icons.photo_camera),
                                          title: new Text("Tomar foto"),
                                          onTap: ()  {
                                            BlocProvider.of<MisnoticiasBloc>(context).add(CargarImagenEvent(takePictureFromCamera: true));
                                            Navigator.pop(context);
                                          }          
                                        ),
                                        new ListTile(
                                          leading: Icon(Icons.photo_library),
                                          title: new Text("Elegir de galería"),
                                          onTap: () {
                                            BlocProvider.of<MisnoticiasBloc>(context).add(CargarImagenEvent(takePictureFromCamera: false));
                                            Navigator.pop(context);
                                          },          
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              );
                            },
                            child: Icon(Icons.photo_camera),
                          )
                        )                        
                      ],
                    ),
                    TextFormField(
                      controller: _titleController,
                      validator: (value) => value.isEmpty ? "Existen campos vacíos" : null,
                      decoration: InputDecoration(
                        hintText: "Titulo",
                        helperText: "Titulo",
                        suffixIcon: Icon(Icons.edit),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _authorController,
                      validator: (value) => value.isEmpty ? "Existen campos vacíos" : null,
                      decoration: InputDecoration(
                        hintText: "Autor",
                        helperText: "Autor",
                        suffixIcon: Icon(Icons.people)
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Descripción"),
                    TextFormField(
                      controller: _descriptionController,
                      validator: (value) => value.isEmpty ? "Existen campos vacíos" : null,
                      maxLines: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0) 
                        )
                      )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RaisedButton(
                          child: Text("Crear"),
                          onPressed: () {
                            if(_formKey.currentState.validate()){
                              BlocProvider.of<MisnoticiasBloc>(context).add(CrearNoticiaEvent(
                                autor: _authorController.text,
                                titulo: _titleController.text,
                                descripcion: _descriptionController.text,
                                fuente: "Noticia Propia" 
                              ));
                            }
                          }
                        ),
                      ],
                    )
                  ]
                ),
              );
            }
            ),
          ),
        )
      )
    );
  }

  
}