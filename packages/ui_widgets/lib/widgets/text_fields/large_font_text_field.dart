import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LargeFontTextField extends StatelessWidget {
  const LargeFontTextField({
    super.key,
    this.initialValue,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.hintText,
    this.onChanged,
  });
  final String? initialValue;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.bold,
          ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
      ),
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      onChanged: onChanged,
    );
  }
}
