import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:santa_game/santa_game.dart';

class TreeComponent extends SpriteComponent with HasGameRef<SantaGame> {
  @override
  FutureOr<void> onLoad() async {
    add(RectangleHitbox());
    //debugMode = true;
    sprite = await Sprite.load('obstacle/tree.png');
    size = Vector2(100, 200);
    position = Vector2(gameRef.size.x, gameRef.size.y - 250);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    x -= dt * 400;
    if (x < -200) {
      gameRef.remove(this);
    }
    super.update(dt);
  }
}
