import 'package:flutter/material.dart';

import 'home/home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool checked = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool conditions = false;
  Color iconColor = Colors.grey;

  bool obscureText = true;
  
  Function _checkConditions() {
    if(checked && _passwordController.text.length != 0 
      && _usernameController.text.length != 0
      && _emailController.text.length != 0) {
        setState(() {
          conditions = true;
        });
      } else {
        setState(() {
          conditions = false;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        height: MediaQuery.of(context).size.height, 
        padding: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Color(0xFF121B22)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
                  child: Image.asset('images/cupping.png'),
                ),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Nombre completo:', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                TextField(
                  controller: _usernameController,
                  onChanged: _checkConditions(),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Email:', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                TextField(
                  controller: _emailController,
                  onChanged: _checkConditions(),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Password:', style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                TextField( 
                  controller: _passwordController,
                  onChanged: _checkConditions(),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: false,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                          if(obscureText) {
                            iconColor = Colors.grey;
                          }else {
                            iconColor = Colors.white;
                          }
                        });
                      },
                      icon: Icon(Icons.remove_red_eye, color: iconColor)
                    )  
                  ),
                  obscureText: obscureText,
                ),
                
                CheckboxListTile(
                  title: Text('ACEPTO LOS TÉRMINOS Y CONDICIONES DE USO',
                    style: TextStyle(color: Colors.grey[200], fontSize: 10),
                  ),
                  value: checked, 
                  onChanged: (newValue){              
                    checked = newValue;
                    _checkConditions();
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: const EdgeInsets.all(0.0),
                  
                ),
                SizedBox(height: 5,),
                RaisedButton(
                  child: Text("REGISTRATE",
                    style: TextStyle(fontSize: 12)
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)
                  ),
                  onPressed: conditions ? (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(title: 'Inicio',)));
                  } : null
                ),
                SizedBox(height: 15,),
                Text("¿Ya tienes una cuenta?", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                ),
                GestureDetector(
                  child: Text("INGRESA", 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    decoration: TextDecoration.underline
                    ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}