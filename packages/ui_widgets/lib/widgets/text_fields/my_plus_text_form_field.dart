import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyPLUSTextFormField extends StatelessWidget {
  const MyPLUSTextFormField({
    super.key,
    this.restorationId,
    this.initialValue,
    this.decoration,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.obscureText = false,
    this.enableSuggestions = true,
    this.autocorrect = true,
    this.focusNode,
    this.controller,
    this.autofillHints,
    this.cursorErrorColor,
    this.readOnly = false,
    this.enabled = true,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.onTap,
  });

  final String? initialValue;
  final String? restorationId;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool obscureText;
  final bool enableSuggestions;
  final bool autocorrect;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final Iterable<String>? autofillHints;
  final Color? cursorErrorColor;
  final bool readOnly;
  final bool enabled;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      restorationId: restorationId,
      style: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) {
          if (enabled == false) {
            return Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w500,
                );
          } else if (states.contains(WidgetState.focused)) {
            return Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                );
          } else {
            return Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w500,
                );
          }
        },
      ),
      initialValue: initialValue,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      readOnly: readOnly,
      enabled: enabled,
      autofillHints: autofillHints,
      controller: controller,
      focusNode: focusNode,
      cursorColor: Theme.of(context).colorScheme.secondary,
      cursorErrorColor: cursorErrorColor ?? Theme.of(context).colorScheme.error,
      decoration: decoration,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,
      enableSuggestions: enableSuggestions,
      autocorrect: autocorrect,
      inputFormatters: inputFormatters,
      onTap: onTap,
      maxLines: maxLines,
      minLines: minLines,
      maxLength: maxLength,
    );
  }
}
