import 'package:dicerolling_game/Homescreen.dart';
import 'package:dicerolling_game/splash.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),
    );
  }
}