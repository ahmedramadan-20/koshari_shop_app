// Packages you must install ==>  simple_animations: ^4.0.1 || supercharged: ^2.1.1

// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({required this.delay, required this.child});

  @override
  Widget build(BuildContext context) {
    // final tween = MultiTween<AniProps>()
    //   ..add(AniProps.opacity, 0.0.tweenTo(1.0), 500.milliseconds)
    //   ..add(AniProps.translateY, (-30.0).tweenTo(0.0), 500.milliseconds,
    //       Curves.easeOut);

    return Animate(
      effects: [
        FadeEffect(
          delay: Duration(
            milliseconds: (500 * delay).round(),
          ),
        ),
        MoveEffect(delay: Duration(milliseconds: (500 * delay).round()))
      ],
      child: child,
    );
    //   PlayAnimation<MultiTweenValues<AniProps>>(
    //   delay: Duration(milliseconds: (500 * delay).round()),
    //   duration: tween.duration,
    //   tween: tween,
    //   child: child,
    //   builder: (context, child, value) => Opacity(
    //     opacity: value.get(AniProps.opacity),
    //     child: Transform.translate(
    //         offset: Offset(0, value.get(AniProps.translateY)), child: child),
    //   ),
    // );
  }
}
