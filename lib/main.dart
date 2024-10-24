import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Purrgatory Dice'),
          backgroundColor: Colors.white,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int left = 1;
  int right = 1;
  String totalRoll = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                      print('Left image is clicked');
                      print(left);
                    },
                    child: Image.asset('images/dice$left.png')),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                      print('Right image is clicked');
                      print(right);
                    },
                    child: Image.asset('images/dice$right.png')),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            totalRoll,
            style: TextStyle(
              fontFamily: 'GloriaHallelujah',
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  void ChangeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
    int sum = (left + right);

    if (left > right) {
      totalRoll = 'You have $sum kitties \n Left dice rolls higher.';
    }

    if (left < right) {
      totalRoll = 'You have $sum kitties \n Right dice rolls higher.';
    }

    if (left == right) {
      totalRoll = 'You have $sum kitties \n Both dice are equal.';
    }
  }
}
