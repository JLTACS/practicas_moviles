import 'package:flutter/material.dart';

import 'home/home.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool conditions = false;

  Function _checkConditions() {
    return (value) {
      if( _usernameController.text.length > 0  
      && _passwordController.text.length > 0) {
        setState(() {
          conditions = true;
        });
      } else {
        setState(() {
          conditions = false;
        });
      }
    };
 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                child: Text('Password:', style: TextStyle(color: Colors.white, fontSize: 12)),
              ),
              TextField( 
                controller: _passwordController,
                onChanged: _checkConditions(),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: false,
                ),
                obscureText: true,
              ),
              
              SizedBox(height: 40,),
              RaisedButton(
                child: Text("ENTRAR",
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
              Expanded(
                  child: Text("¿Olvidaste tu contraseña?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12
                  ),
                ),
              ),
              Text("¿Aún no tienes una cuenta?", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12
                ),
              ),
              GestureDetector(
                child: Text("REGISTRATE", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  decoration: TextDecoration.underline
                  ),
                ),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                },
              )
            ],
          ),
        ),
      )
    );
  }
}