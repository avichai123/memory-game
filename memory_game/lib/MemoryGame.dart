import 'package:flutter/material.dart';

class MemoryGame extends StatelessWidget {
  const MemoryGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("MemoryGame"),
        ),
        body: Container(child: const Placeholder()),
      ),
    );
  }
}