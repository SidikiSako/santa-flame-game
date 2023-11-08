import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/santa_game.dart';

void main() {
  final game = SantaGame();
  runApp(
    MaterialApp(
      home: GameWidget(game: game),
      debugShowCheckedModeBanner: false,
    ),
  );
}
