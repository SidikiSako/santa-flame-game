import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:santa_game/santa_game.dart';

class Background extends ParallaxComponent<SantaGame> {
  @override
  FutureOr<void> onLoad() async {
    parallax = await game.loadParallax([
      ParallaxImageData('parallax/sky.png'),
      ParallaxImageData('parallax/bg.png'),
      ParallaxImageData('parallax/middle.png'),
      ParallaxImageData('parallax/foreground.png'),
      ParallaxImageData('parallax/ground_01.png'),
      ParallaxImageData('parallax/ground_02.png'),
      ParallaxImageData('parallax/snow.png'),
    ],
        baseVelocity: Vector2(100, 0),
        velocityMultiplierDelta: Vector2(1.1, 1.0));

    return super.onLoad();
  }
}
