import 'package:estructura_practica_1/login.dart';
import 'package:estructura_practica_1/register.dart';
import 'package:flutter/material.dart';

class BeginPage extends StatelessWidget {
  const BeginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image.asset('images/cupping.png'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text("REGISTRATE",
                  style: TextStyle(fontSize: 12)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.black)
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                }
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text("INGRESA",
                  style: TextStyle(fontSize: 12)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.black)
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                }
              ),
            )
          ],
        ),
      )
    );
  }
}