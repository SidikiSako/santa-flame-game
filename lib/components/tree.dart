import 'dart:async';

import 'package:flame/components.dart';
import 'package:santa_game/santa_game.dart';

class TreeComponent extends SpriteComponent with HasGameRef<SantaGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('obstacle/tree.png');
    size = Vector2(100, 200);
    position = Vector2(0, gameRef.size.y - 250);
    return super.onLoad();
  }
}
