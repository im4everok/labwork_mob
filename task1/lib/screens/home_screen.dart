import 'package:flutter/material.dart';
import 'package:task1/data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Data;

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Home screen", style: TextStyle(fontSize: 25)),
          Text("${args.name} ${args.surname}"),
        ],
      ),
    ));
  }
}
