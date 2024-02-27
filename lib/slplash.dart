import 'package:ai_physics_education/home.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(Splash());
}

void setState(Null Function() param0) {}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  // var splash = 'assets/splash.gif';

  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  build(context) {
    return const MaterialApp(
      home: Scaffold(
          body: Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                // mainAxisAlignment: MainAxisAlignment.center,
                child:
                // Container(height: 10),
                Image(image: AssetImage('assets/splash.png')),
              ))),
      debugShowCheckedModeBanner: false,
    );
  }

  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}