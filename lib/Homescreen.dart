import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var leftDiceNumber = 1;
  var rightDiceNumber = 2;
  late AnimationController _controller;
  // late CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);


    _controller.addListener(() {
      setState(() {});
      print(_controller.value);
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        print('conpleted');
        _controller.reverse();
      }
    });
  }

  void roll() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dice rolling game"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                          height: 200 - (_controller.value) * 200,
                          'assets/images/dice-$leftDiceNumber.jpg'),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onDoubleTap: roll,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(
                          height: 200 - (_controller.value) * 200,
                          'assets/images/dice-$rightDiceNumber.jpg'),
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 21),
              ElevatedButton(
                  onPressed: roll,
                  child: const Text(
                    "Roll",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
