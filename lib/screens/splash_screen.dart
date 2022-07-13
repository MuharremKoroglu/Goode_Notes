import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_page.dart';

class SplasWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: HomePage(),
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.teal, Colors.green],
      ),
      title: Text(
        'Goode Notes',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontFamily: 'Kaushan',
          color: Colors.white,
        ),
      ),
      image: Image.asset('assets/images/goode_notes.png'),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 150.0,
      loaderColor: Colors.white,
    );
  }
}
