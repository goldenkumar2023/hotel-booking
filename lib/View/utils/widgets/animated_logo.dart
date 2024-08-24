import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: FlareActor(
        'assets/animated/9327448.jpg',
        animation: 'animate',
        alignment: Alignment.center,
        fit: BoxFit.contain,
      ),
    );
  }
}
