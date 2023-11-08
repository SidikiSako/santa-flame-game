import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:santa_game/santa_game.dart';

class Play extends SpriteComponent with HasGameRef<SantaGame>, TapCallbacks {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('play.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y / 2);
    anchor = Anchor.center;
    return super.onLoad();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);
    gameRef.startGame();
  }
}
