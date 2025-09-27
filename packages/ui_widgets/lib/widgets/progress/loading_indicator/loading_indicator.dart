import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingIndicatorConstants {
  static const double circularIndicatorSize = 30.0;
  static const double cupertinoIndicatorRadius = 15.0;
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator(
            color: color,
            radius: LoadingIndicatorConstants.cupertinoIndicatorRadius,
          )
        : SizedBox(
            width: LoadingIndicatorConstants.circularIndicatorSize,
            height: LoadingIndicatorConstants.circularIndicatorSize,
            child: CircularProgressIndicator(
              color: color,
            ),
          );
  }
}
