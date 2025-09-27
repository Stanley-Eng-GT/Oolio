import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foundation/utils/text_input_formatter/phone_number_formatter.dart';
import 'package:foundation/utils/validators/mobile_number_validator.dart';

import '../../generated/l10n.dart';
import '../../theme/gaps.dart';

class MobileNumberTextFormField extends StatelessWidget {
  const MobileNumberTextFormField({
    super.key,
    this.focusNode,
    this.decoration,
    this.onEditingComplete,
    this.controller,
    MobileNumberValidator? mobileNumberValidator,
  }) : validator = mobileNumberValidator ?? const MobileNumberValidator();

  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final VoidCallback? onEditingComplete;
  final TextEditingController? controller;
  final MobileNumberValidator validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.secondary,
        decoration: decoration ??
            InputDecoration(
              hintText: S.of(context).mobileNumber,
              prefixIcon: Padding(
                padding: const EdgeInsets.fromLTRB(
                  Gaps.spacing24,
                  Gaps.spacing8,
                  Gaps.spacing16,
                  Gaps.spacing8,
                ),
                child: SizedBox(
                  height: Gaps.spacing36,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        PhoneNumberFormatterConstants.countryCode,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: Gaps.spacing16),
                      VerticalDivider(
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                ),
              ),
            ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
        validator: (mobileNo) {
          final mobileNumber = mobileNo?.replaceAll(' ', '') ?? '';
          if (!validator.validate(mobileNumber)) {
            return S.of(context).mobileNumberFormatErrorMessage;
          }
          return null;
        },
        onEditingComplete: onEditingComplete,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              PhoneNumberFormatterConstants.mobileNumberLength),
          PhoneNumberFormatter(phoneNumberType: PhoneNumberType.mobile),
        ]);
  }
}
