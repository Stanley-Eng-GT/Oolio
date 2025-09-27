import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/theme/radius_values.dart';

import 'my_plus_text_form_field.dart';

class FormItemTextField extends StatelessWidget {
  const FormItemTextField({
    super.key,
    this.restorationId,
    this.initialValue,
    required this.label,
    this.hintText,
    this.errorText,
    this.textInputAction,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.readOnly = false,
    this.enabled = true,
    this.prefix,
    this.suffixIcon,
    this.focusNode,
    this.keyboardType,
    this.textCapitalization,
    this.inputFormatters,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.counterText,
    this.onTap,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.enabledFillColor,
    this.disabledFillColor,
  });
  final String? restorationId;
  final String? initialValue;
  final String label;
  final String? hintText;
  final String? errorText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  final bool readOnly;
  final bool enabled;
  final Widget? prefix;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final String? counterText;
  final VoidCallback? onTap;
  final FloatingLabelBehavior floatingLabelBehavior;
  final Color? enabledFillColor;
  final Color? disabledFillColor;

  @override
  Widget build(BuildContext context) {
    return MyPLUSTextFormField(
      restorationId: restorationId,
      initialValue: initialValue,
      maxLines: maxLines,
      maxLength: maxLength,
      minLines: minLines,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      onTap: onTap,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      focusNode: focusNode,
      readOnly: readOnly,
      enabled: enabled,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        floatingLabelBehavior: floatingLabelBehavior,
        counterText: counterText,
        counterStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Theme.of(context).colorScheme.secondary,
            ),
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.fromLTRB(
          Gaps.spacing0,
          Gaps.spacing20,
          Gaps.spacing16,
          Gaps.spacing20,
        ),
        fillColor: _getFillColor(context),
        filled: true,
        label: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: Gaps.spacing20),
            child: Text(
              label,
            ),
          ),
        ),
        suffixIcon: suffixIcon,
        prefix: prefix ?? const SizedBox(width: Gaps.spacing20),
        errorText: errorText,
        hintText: hintText,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).colorScheme.secondary),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(RadiusValues.circular4),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Color _getFillColor(BuildContext context) {
    return enabled
        ? enabledFillColor ?? Theme.of(context).scaffoldBackgroundColor
        : disabledFillColor ?? Theme.of(context).colorScheme.inverseSurface;
  }
}
