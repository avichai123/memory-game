import 'package:flutter/material.dart';
import 'package:memory_game/game_provider.dart';
import 'package:provider/provider.dart';

class MemoryGame extends StatelessWidget {
  const MemoryGame({super.key});

  @override
  Widget build(BuildContext context) {
    final memoryProvider = Provider.of<GameProvider>(context);

    memoryProvider.updateShuffleArrState();

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: Center(child: const Text("Memorey Game")),
          backgroundColor: Colors.blue),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: memoryProvider.buildColumns(),
        ),
      ),
    ));

    
    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text("MemoryGame"),
    //     ),
    //     body: Container(child: const Placeholder()),
    //   ),
    // );
  }
}