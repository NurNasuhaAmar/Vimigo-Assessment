import 'package:flame/components.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/extensions.dart';

class CoinAnimation extends StatelessWidget {
  const CoinAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache('animation.png'),
        SpriteAnimationData.sequenced(amount: 12, stepTime: 0.2, textureSize: Vector2(170, 145)),
    );

    return Container(
      width: 100,
      height: 100,
      child: SpriteAnimationWidget(
        animation: _animation,
        anchor: Anchor.center,
      ),
    );
  }
}
