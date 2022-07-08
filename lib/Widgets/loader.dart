import 'package:flutter/material.dart';

class LoaderAnimation extends StatefulWidget {
  const LoaderAnimation({Key? key}) : super(key: key);

  @override
  State<LoaderAnimation> createState() => _LoaderAnimationState();
}

class _LoaderAnimationState extends State<LoaderAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat(reverse: true);

  late final Animation<double> _tween =
      Tween(begin: 0.0, end: 1.0).animate(_controller);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _tween,
        child: Image.asset("./images/logo.png"),
    );
  }
}
