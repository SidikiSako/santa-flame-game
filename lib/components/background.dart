import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('parallax/sky.png');
    return super.onLoad();
  }
}
