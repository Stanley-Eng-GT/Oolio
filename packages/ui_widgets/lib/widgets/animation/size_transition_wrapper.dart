import 'package:flutter/material.dart';

class SizeTransitionWrapper extends StatefulWidget {
  final Widget child;
  final Axis axis;
  final Duration duration;

  const SizeTransitionWrapper(
      {super.key,
      this.axis = Axis.horizontal,
      this.duration = const Duration(seconds: 1),
      required this.child});

  @override
  SizeTransitionWrapperState createState() => SizeTransitionWrapperState();
}

class SizeTransitionWrapperState extends State<SizeTransitionWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _prepareAnimations();
  }

  ///Setting up the animation
  void _prepareAnimations() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration)
          ..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      axis: widget.axis,
      sizeFactor: _animation,
      axisAlignment: -1.0,
      child: widget.child,
    );
  }
}
