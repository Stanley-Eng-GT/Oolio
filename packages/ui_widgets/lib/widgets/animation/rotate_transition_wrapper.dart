import 'package:flutter/material.dart';

class RotateTransitionWrapper extends StatefulWidget {
  const RotateTransitionWrapper({
    super.key,
    required this.child,
    required this.isRotated,
    this.duration = const Duration(milliseconds: 500),
    this.rotationFraction = 0.25, // Default to 90 degrees (quarter-turn).
  });

  final Widget child;
  final bool isRotated;
  final Duration duration;
  final double rotationFraction;

  @override
  State<RotateTransitionWrapper> createState() =>
      _RotateTransitionWrapperState();
}

class _RotateTransitionWrapperState extends State<RotateTransitionWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and rotation animation
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: widget.rotationFraction,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    // Trigger the animation based on the initial isRotated value
    if (widget.isRotated) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant RotateTransitionWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Trigger the animation when the isRotated value changes
    if (widget.isRotated != oldWidget.isRotated) {
      if (widget.isRotated) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation, // Apply the rotation animation
      child: widget.child,
    );
  }
}
