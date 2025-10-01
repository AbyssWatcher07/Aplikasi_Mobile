import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add,
                color: Colors.amber,
                size: 50.0,
              ),
              SizedBox(width: 20),
              Icon(
                CupertinoIcons.add,
                color: Colors.red,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}