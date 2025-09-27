import 'package:flutter/material.dart';
import 'package:foundation/utils/validators/password_validator.dart';

import '../../../generated/l10n.dart';
import '../../../theme/gaps.dart';

class _PasswordProgressViewConstants {
  static const int uppercaseLetterCount = 1;
  static const int lowercaseLetterCount = 1;
  static const int numericCharacterCount = 1;
  static const int specialCharacterCount = 1;
  static const int minimumLength = 8;
  static const double prefixDotSize = 14.0;
}

class PasswordProgressView extends StatelessWidget {
  const PasswordProgressView({
    super.key,
    required this.password,
    this.passwordsMatch = false,
    PasswordValidator? passwordValidator,
  }) : _pwdValidator = passwordValidator ?? const PasswordValidator();
  final String password;
  final bool passwordsMatch;
  final PasswordValidator _pwdValidator;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordProgressCheckItemView(
          isSatisfied: _pwdValidator.hasMinimumLength(
              password, _PasswordProgressViewConstants.minimumLength),
          label: S.of(context).passwordProgressEightCharacter,
        ),
        const SizedBox(height: Gaps.spacing4),
        PasswordProgressCheckItemView(
          isSatisfied: _pwdValidator.hasMinimumUppercase(
              password, _PasswordProgressViewConstants.uppercaseLetterCount),
          label: S.of(context).passwordProgressUppercaseLetter,
        ),
        const SizedBox(height: Gaps.spacing4),
        PasswordProgressCheckItemView(
          isSatisfied: _pwdValidator.hasMinimumLowercase(
              password, _PasswordProgressViewConstants.lowercaseLetterCount),
          label: S.of(context).passwordProgressLowercase,
        ),
        const SizedBox(height: Gaps.spacing4),
        PasswordProgressCheckItemView(
          isSatisfied: _pwdValidator.hasMinimumNumericCharacters(
              password, _PasswordProgressViewConstants.numericCharacterCount),
          label: S.of(context).passwordProgressNumericCharacter,
        ),
        const SizedBox(height: Gaps.spacing4),
        PasswordProgressCheckItemView(
          isSatisfied: _pwdValidator.hasMinimumSpecialCharacters(
              password, _PasswordProgressViewConstants.specialCharacterCount),
          label: S.of(context).passwordProgressSpecialCharacter,
        ),
        const SizedBox(height: Gaps.spacing4),
        PasswordProgressCheckItemView(
          isSatisfied: passwordsMatch,
          label: S.of(context).passwordProgressPasswordMatch,
        ),
      ],
    );
  }
}

class PasswordProgressCheckItemView extends StatelessWidget {
  final bool isSatisfied;
  final String label;
  const PasswordProgressCheckItemView(
      {super.key, required this.isSatisfied, required this.label});
  @override
  Widget build(BuildContext context) {
    final color = isSatisfied
        ? Theme.of(context).colorScheme.outlineVariant
        : Theme.of(context).colorScheme.error;
    return Row(
      children: [
        Icon(
          isSatisfied ? Icons.check : Icons.close,
          color: color,
          size: _PasswordProgressViewConstants.prefixDotSize,
        ),
        const SizedBox(
          width: Gaps.spacing2,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: color,
              ),
        ),
      ],
    );
  }
}
