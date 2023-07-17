import 'package:flutter/material.dart';
import 'package:iitd/LandingPage/HomePage2.dart';
import 'package:iitd/LandingPage/LandingPage.dart';
import 'package:iitd/Navbar/Navbar1.dart';
import 'package:iitd/LandingPage/HomePage.dart';
import 'package:iitd/LandingPage/Meter1.dart';
import 'package:iitd/LandingPage/Meter2.dart';

void main() {
  runApp( IITdApp());
}
class IITdApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IIT Energy Meter',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Montserrat"
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        'home': (context) => MyHomePage(),
        '/meter1': (context) => Meter1(),
        '/meter2': (context) => Meter2(),
      },
    );
  }
}


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(67, 237, 249, 1.0),
                Color.fromRGBO(138, 255, 210, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: HomePage(),

              )
            ],
          ),
        ),
      ),
    );
  }
}

class Meter1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(67, 237, 249, 1.0),
                Color.fromRGBO(138, 255, 210, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Meter1Page(),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class Meter2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(67, 237, 249, 1.0),
                Color.fromRGBO(138, 255, 210, 1.0)
              ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Navbar(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Meter2Page(),
              )

            ],
          ),
        ),
      ),
    );
  }
}