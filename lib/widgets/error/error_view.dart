import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/buttons/cta_outlined_button.dart';

import '../../../gen/assets.gen.dart';

class _ErrorViewConstants {
  static const int animationDurationInMilliseconds = 600;
  static const double animationBeginVal = 0.0;
  static const double animationEndVal = 1.0;
  static const String confirmButtonTitle = 'Try again';
  static const String errorTitle = 'Oops! Something went wrong.';
  static const String errorBody =
      'An error occurred while processing your request. Please try again later.';
  static const double half = 0.5;
  static const double imageSize = 250.0;
  static const int matrixCol = 2;
  static const int matrixRow = 3;
  static const double matrixVal = 0.001;
  static const double pi = 3.14;
}

class ErrorView extends StatefulWidget {
  const ErrorView({
    super.key,
    required this.message,
    this.foregroundColor,
    this.onPressed,
  });

  final String message;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: _ErrorViewConstants.animationDurationInMilliseconds,
      ),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: _ErrorViewConstants.animationBeginVal,
      end: _ErrorViewConstants.animationEndVal,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleView() {
    if (_showMessage) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _showMessage = !_showMessage;
  }

  @override
  Widget build(BuildContext context) {
    final color =
        widget.foregroundColor ?? Theme.of(context).colorScheme.secondary;
    return TextButton(
      onPressed: _toggleView,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          final isUnder = _animation.value > _ErrorViewConstants.half;
          final transform = Matrix4.identity()
            ..setEntry(
              _ErrorViewConstants.matrixRow,
              _ErrorViewConstants.matrixCol,
              _ErrorViewConstants.matrixVal,
            )
            ..rotateY(_ErrorViewConstants.pi * _animation.value);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: isUnder
                ? Transform(
                    transform: Matrix4.identity()
                      ..rotateY(_ErrorViewConstants.pi),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Text(
                        widget.message,
                        key: const ValueKey('message'),
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: color,
                                ),
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.images.errorViewImage.image(
                          fit: BoxFit.contain,
                          width: _ErrorViewConstants.imageSize,
                          height: _ErrorViewConstants.imageSize,
                        ),
                        const SizedBox(height: Gaps.spacing16),
                        Text(
                          _ErrorViewConstants.errorTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: color,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const SizedBox(height: Gaps.spacing16),
                        Text(
                          _ErrorViewConstants.errorBody,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: color),
                        ),
                        const SizedBox(height: Gaps.spacing32),
                        if (widget.onPressed != null)
                          CTAOutlinedButton(
                            mainAxisSize: MainAxisSize.min,
                            buttonStyle: ButtonStyle(
                              side: WidgetStateProperty.all<BorderSide>(
                                  BorderSide(
                                color: color,
                              )),
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                  const EdgeInsets.symmetric(
                                vertical: Gaps.spacing12,
                                horizontal: Gaps.spacing48,
                              )),
                            ),
                            label: _ErrorViewConstants.confirmButtonTitle,
                            textStyle:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: color,
                                      fontWeight: FontWeight.bold,
                                    ),
                            onPressed: widget.onPressed,
                          ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
