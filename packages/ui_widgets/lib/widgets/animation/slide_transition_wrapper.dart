import 'package:flutter/material.dart';

class SlideTransitionWrapper extends StatefulWidget {
  final Widget child;

  final Duration duration;

  const SlideTransitionWrapper(
      {super.key,
      this.duration = const Duration(seconds: 1),
      required this.child});

  @override
  SlideTransitionWrapperState createState() => SlideTransitionWrapperState();
}

class SlideTransitionWrapperState extends State<SlideTransitionWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;

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
    _animation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
