import 'package:flutter/material.dart';
import 'package:memory_game/MemoryGame.dart';
import 'package:memory_game/game_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameProvider(),
      child: const MemoryGame(),
    ),
  );
}
