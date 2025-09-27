import 'package:flutter/material.dart';
import 'package:foundation/utils/validators/password_validator.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/text_fields/my_plus_text_form_field.dart';
import '../../generated/l10n.dart';

class _SetUpPasswordConstants {
  static const double errorTextHeight = 0.01;
  static const int uppercaseLetterCount = 1;
  static const int lowercaseLetterCount = 1;
  static const int numericCharacterCount = 1;
  static const int specialCharacterCount = 1;
  static const int minimumLength = 8;
  static const double iconHighLightOpacity = 0.1;
  static const double iconHidePasswordOpacity = 0.3;
  static const int textFieldMaxLines = 1;
}

class SetUpPasswordView extends StatefulWidget {
  const SetUpPasswordView({
    super.key,
    this.formKey,
    PasswordValidator? passwordValidator,
    required this.newPwdController,
    required this.confirmPwdController,
    this.onSubmit,
    this.newPwdOnChanged,
    this.confirmPwdOnChanged,
  }) : pwdValidator = passwordValidator ?? const PasswordValidator();

  final GlobalKey<FormState>? formKey;
  final PasswordValidator pwdValidator;
  final TextEditingController newPwdController;
  final TextEditingController confirmPwdController;
  final VoidCallback? onSubmit;
  final ValueChanged<String>? newPwdOnChanged;
  final ValueChanged<String>? confirmPwdOnChanged;

  @override
  State<SetUpPasswordView> createState() => _SetUpPasswordViewState();
}

class _SetUpPasswordViewState extends State<SetUpPasswordView> {
  final FocusNode _passwordFocusNode = FocusNode();
  bool _hideNewPassword = true;
  bool _hideConfirmPassword = true;

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          MyPLUSTextFormField(
            controller: widget.newPwdController,
            onChanged: widget.newPwdOnChanged,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                  height: _SetUpPasswordConstants.errorTextHeight),
              hintText: S.of(context).enterNewPassword,
              suffixIcon: IconButton(
                highlightColor: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(
                        alpha: _SetUpPasswordConstants.iconHighLightOpacity),
                icon: Icon(
                  _hideNewPassword ? Icons.visibility_off : Icons.visibility,
                  color: _hideNewPassword
                      ? Theme.of(context).colorScheme.secondary.withValues(
                          alpha:
                              _SetUpPasswordConstants.iconHidePasswordOpacity)
                      : null,
                ),
                onPressed: () {
                  setState(() {
                    _hideNewPassword = !_hideNewPassword;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.next,
            obscureText: _hideNewPassword,
            maxLines: _SetUpPasswordConstants.textFieldMaxLines,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) {
              if (!widget.pwdValidator.hasMinimumUppercase(
                  widget.newPwdController.text,
                  _SetUpPasswordConstants.uppercaseLetterCount)) {
                return '';
              } else if (!widget.pwdValidator.hasMinimumLowercase(
                  widget.newPwdController.text,
                  _SetUpPasswordConstants.lowercaseLetterCount)) {
                return '';
              } else if (!widget.pwdValidator.hasMinimumNumericCharacters(
                  widget.newPwdController.text,
                  _SetUpPasswordConstants.numericCharacterCount)) {
                return '';
              } else if (!widget.pwdValidator.hasMinimumSpecialCharacters(
                  widget.newPwdController.text,
                  _SetUpPasswordConstants.specialCharacterCount)) {
                return '';
              } else if (!widget.pwdValidator.hasMinimumLength(
                  widget.newPwdController.text,
                  _SetUpPasswordConstants.minimumLength)) {
                return '';
              }
              return null;
            },
            onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
          ),
          const SizedBox(height: Gaps.spacing12),
          MyPLUSTextFormField(
            controller: widget.confirmPwdController,
            onChanged: widget.confirmPwdOnChanged,
            focusNode: _passwordFocusNode,
            decoration: InputDecoration(
              errorStyle: const TextStyle(
                  height: _SetUpPasswordConstants.errorTextHeight),
              hintText: S.of(context).confirmNewPassword,
              suffixIcon: IconButton(
                highlightColor: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(
                        alpha: _SetUpPasswordConstants.iconHighLightOpacity),
                icon: Icon(
                  _hideConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: _hideConfirmPassword
                      ? Theme.of(context).colorScheme.secondary.withValues(
                          alpha:
                              _SetUpPasswordConstants.iconHidePasswordOpacity)
                      : null,
                ),
                onPressed: () {
                  setState(() {
                    _hideConfirmPassword = !_hideConfirmPassword;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.go,
            obscureText: _hideConfirmPassword,
            maxLines: _SetUpPasswordConstants.textFieldMaxLines,
            enableSuggestions: false,
            autocorrect: false,
            validator: (value) {
              if (widget.newPwdController.text !=
                  widget.confirmPwdController.text) {
                return '';
              }
              return null;
            },
            onFieldSubmitted: (_) => widget.onSubmit?.call(),
          ),
        ],
      ),
    );
  }
}
