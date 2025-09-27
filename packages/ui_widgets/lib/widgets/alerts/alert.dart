import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_widgets/theme/gaps.dart';

enum AlertButtonOnTapType {
  cancel,
  confirm,
}

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.content,
    this.confirmButtonTitle,
    this.cancelButtonTitle,
    this.onTap,
  });

  final String title;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final String? confirmButtonTitle;
  final String? cancelButtonTitle;
  final ValueChanged<AlertButtonOnTapType>? onTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlert(
            title: title,
            titleTextStyle: titleTextStyle,
            content: content,
            confirmButtonTitle: confirmButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            onTap: onTap,
          )
        : MaterialAlert(
            title: title,
            titleTextStyle: titleTextStyle,
            content: content,
            confirmButtonTitle: confirmButtonTitle,
            cancelButtonTitle: cancelButtonTitle,
            onTap: onTap,
          );
  }
}

class MaterialAlert extends StatelessWidget {
  const MaterialAlert({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.content,
    this.confirmButtonTitle,
    this.cancelButtonTitle,
    this.onTap,
  });
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final String? confirmButtonTitle;
  final String? cancelButtonTitle;
  final ValueChanged<AlertButtonOnTapType>? onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: titleTextStyle),
      content: content,
      actions: [
        if (cancelButtonTitle?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(right: Gaps.spacing4),
            child: TextButton(
                onPressed: () => onTap?.call(AlertButtonOnTapType.cancel),
                child: Text(
                  cancelButtonTitle!,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.w500,
                      ),
                )),
          ),
        if (confirmButtonTitle?.isNotEmpty == true)
          Padding(
            padding: const EdgeInsets.only(left: Gaps.spacing4),
            child: TextButton(
                onPressed: () => onTap?.call(AlertButtonOnTapType.confirm),
                child: Text(confirmButtonTitle!,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ))),
          ),
      ],
    );
  }
}

class CupertinoAlert extends StatelessWidget {
  const CupertinoAlert({
    super.key,
    required this.title,
    this.titleTextStyle,
    this.content,
    this.confirmButtonTitle,
    this.cancelButtonTitle,
    this.onTap,
  });
  final String title;
  final TextStyle? titleTextStyle;
  final Widget? content;
  final String? confirmButtonTitle;
  final String? cancelButtonTitle;
  final ValueChanged<AlertButtonOnTapType>? onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title, style: titleTextStyle),
      content: content,
      actions: <CupertinoDialogAction>[
        if (cancelButtonTitle?.isNotEmpty == true)
          CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => onTap?.call(AlertButtonOnTapType.cancel),
              child: Text(
                cancelButtonTitle!,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.error,
                    ),
              )),
        if (confirmButtonTitle?.isNotEmpty == true)
          CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () => onTap?.call(AlertButtonOnTapType.confirm),
              child: Text(confirmButtonTitle!)),
      ],
    );
  }
}
