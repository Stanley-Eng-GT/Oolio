import 'package:flutter/material.dart';

class _MultilineTextFieldConstants {
  static const int hintMaxLines = 5;
}

class MultilineTextField extends StatelessWidget {
  const MultilineTextField({
    super.key,
    this.hintText,
    this.controller,
    this.maxLine,
    this.maxLength,
    this.counterText,
    this.validator,
  });
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLine;
  final int? maxLength;
  final String? counterText;
  final FormFieldValidator<String?>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
      maxLines: maxLine,
      maxLength: maxLength,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: hintText,
        hintMaxLines: _MultilineTextFieldConstants.hintMaxLines,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
        counterText: counterText,
        counterStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
      ),
      keyboardType: TextInputType.multiline,
      validator: validator,
      textInputAction: TextInputAction.done,
      textCapitalization: TextCapitalization.sentences,
    );
  }
}
