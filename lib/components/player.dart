import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:santa_game/santa_game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SantaGame>, CollisionCallbacks {
  Player() : super(size: Vector2.all(200));

  @override
  FutureOr<void> onLoad() async {
    add(RectangleHitbox.relative(Vector2(0.3, 0.8), parentSize: size));
    //debugMode = true;
    final spritesList = <Sprite>[];
    for (var i = 1; i <= 10; i++) {
      spritesList.add(await Sprite.load('player/r$i.png'));
    }
    animation = SpriteAnimation.spriteList(spritesList, stepTime: 0.1);
    position = Vector2(50, gameRef.size.y - 250);
    return super.onLoad();
  }

  void jump() {
    final jumpEffect = MoveByEffect(
      Vector2(0, -260),
      EffectController(duration: 0.7, curve: Curves.decelerate),
      onComplete: () {
        final fallEffect = MoveByEffect(
          Vector2(0, 260),
          EffectController(
            duration: 0.7,
            curve: Curves.fastOutSlowIn,
          ),
        );
        add(fallEffect);
      },
    );
    add(jumpEffect);
    FlameAudio.play('jump.mp3', volume: 0.5);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    FlameAudio.play('collision.mp3', volume: 0.5);
    gameRef.gameOver();
  }
}
