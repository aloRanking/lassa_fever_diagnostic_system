import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps { opacity, translateX }
class SlideAnimation extends StatelessWidget {

  final double delay;
  final Widget child;

  SlideAnimation({this.delay, this.child});


  @override
  Widget build(BuildContext context) {

     final tween = MultiTween<AniProps>()

    ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0))
      ..add(AniProps.translateX, Tween(begin: -30.0, end: 0.0),
          Duration(milliseconds: 500), Curves.easeOut);

    return  PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
          offset: Offset(animation.get(AniProps.translateX),0 ),
          child: child
        ),
      ),
    );
  }
}