import 'package:flutter/material.dart';
import 'package:foundation/utils/validators/email_validator.dart';
import 'package:ui_widgets/theme/gaps.dart';
import 'package:ui_widgets/widgets/text_fields/my_plus_text_form_field.dart';

import '../../generated/l10n.dart';

class _EmailPasswordViewConstants {
  static const int textFieldMaxLines = 1;
  static const double iconButtonHighlightColorOpacity = 0.1;
  static const double hidePasswordIconColorOpacity = 0.3;
}

class EmailPasswordView extends StatefulWidget {
  const EmailPasswordView({
    super.key,
    this.formKey,
    this.emailController,
    this.passwordController,
    EmailValidator? emailValidator,
    this.errorMessage,
    this.onSubmit,
    this.onChanged,
  }) : validator = emailValidator ?? const EmailValidator();

  final GlobalKey<FormState>? formKey;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final EmailValidator validator;
  final String? errorMessage;
  final VoidCallback? onSubmit;
  final VoidCallback? onChanged;

  @override
  State<EmailPasswordView> createState() => _EmailPasswordViewState();
}

class _EmailPasswordViewState extends State<EmailPasswordView> {
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          MyPLUSTextFormField(
            autocorrect: false,
            maxLines: _EmailPasswordViewConstants.textFieldMaxLines,
            controller: widget.emailController,
            decoration: InputDecoration(
              hintText: S.of(context).emailAddress,
            ),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (email) {
              if (email?.isEmpty == true) {
                return S.of(context).emailAddressEmptyErrorMessage;
              } else if (!EmailValidator.validate(email!)) {
                return S.of(context).emailAddressFormatErrorMessage;
              }
              return null;
            },
            onChanged: (_) => widget.onChanged?.call(),
          ),
          const SizedBox(height: Gaps.spacing20),
          MyPLUSTextFormField(
            controller: widget.passwordController,
            decoration: InputDecoration(
              errorText: widget.errorMessage,
              hintText: S.of(context).password,
              suffixIcon: IconButton(
                highlightColor: Theme.of(context)
                    .colorScheme
                    .secondary
                    .withValues(
                        alpha: _EmailPasswordViewConstants
                            .iconButtonHighlightColorOpacity),
                icon: Icon(
                  _hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: _hidePassword
                      ? Theme.of(context).colorScheme.secondary.withValues(
                          alpha: _EmailPasswordViewConstants
                              .hidePasswordIconColorOpacity)
                      : null,
                ),
                onPressed: () {
                  setState(() {
                    _hidePassword = !_hidePassword;
                  });
                },
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.go,
            obscureText: _hidePassword,
            maxLines: _EmailPasswordViewConstants.textFieldMaxLines,
            enableSuggestions: false,
            autocorrect: false,
            validator: (password) {
              if (password?.isEmpty == true) {
                return S.of(context).passwordEmptyErrorMessage;
              } else if (widget.errorMessage?.isNotEmpty == true) {
                return widget.errorMessage;
              }
              return null;
            },
            onFieldSubmitted: (_) => widget.onSubmit?.call(),
            onChanged: (_) => widget.onChanged?.call(),
          ),
        ],
      ),
    );
  }
}
