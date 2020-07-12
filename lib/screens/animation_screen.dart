import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.repeat(
            min: 0.0,
            max: 2 * math.pi,
            period: Duration(
              seconds: 2,
            ),
            reverse: true,
          );
        } else if (status == AnimationStatus.dismissed) {
          _animationController.forward();
        }
      });
    _animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Animation'),
      ),
      body: Transform.rotate(
        angle: _animation.value,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(30.0),
          child: Image.asset('assets/fan.png'),
        ),
      ),
    );
  }
}
