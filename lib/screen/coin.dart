import 'package:flame/components.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/extensions.dart';

class CoinAnimation extends StatelessWidget {
  const CoinAnimation({Key? key}) : super(key: key);

  //const CoinAnimation({Key? key}) : super(key: key);

  //var _animation;

  // Future<void> onLoad() async {
  //   var spriteSheet = await Flame.images.load('animation.png');
  //   // var _animation = SpriteAnimation.fromFrameData(
  //   //   Flame.images.fromCache('animation.png'),
  //   //   SpriteAnimationData.sequenced(amount: 35, stepTime: 1.0, textureSize: Vector2.all(50)),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    //var image = Flame.images.load('animation.png');
    var _animation = SpriteAnimation.fromFrameData(
        Flame.images.fromCache('animation.png'),
        SpriteAnimationData.sequenced(amount: 35, stepTime: 0.2, textureSize: Vector2(16, 18))
    );

    return Container(
      width: 50,
      height: 50,
      child: SpriteAnimationWidget(
        animation: _animation,
        playing: true,
        anchor: Anchor.center,
      ),
    );
  }
}

// class CoinAnimation extends StatefulWidget {
//   const CoinAnimation({Key? key}) : super(key: key);
//
//   @override
//   _CoinAnimationState createState() => _CoinAnimationState();
// }
//
//
// class _CoinAnimationState extends State<CoinAnimation> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//         // return Center(
//         //   child: SpriteAnimationWidget(
//         //     animation: spriteAnimation,
//         //     playing: true,
//         //     anchor: Anchor.center,
//         //   )
//         // );
//   }
//
//   Future<void> onLoad() async {
//     await Flame.images.load('animation.png');
//     // final animationData = SpriteAnimationData.sequenced(
//     //     amount: 5, stepTime: 1.0, textureSize: Vector2.all(50));
//     // final spriteAnimation = await SpriteAnimation.load(
//     //     'animation.png', animationData);
//   }
// }

// class coinAnimation extends StatefulWidget {
//   const coinAnimation({Key? key}) : super(key: key);
//
//   Future<void> onLoad() async {
//     final animationData = SpriteAnimationData.sequenced(
//         amount: 5, stepTime: 1.0, textureSize: Vector2.all(50));
//     final spriteAnimation = await SpriteAnimation.load(
//         'animation.png', animationData);
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SpriteAnimationWidget(
//         animation: spriteAnimation,
//         playing: true,
//         anchor: Anchor.center,
//       ),
//     );
//   }
// }
