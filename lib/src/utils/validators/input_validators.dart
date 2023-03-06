import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/widgets.dart';

String? nameValidator(BuildContext context, String? value) {
  if (value == null || value.length < 2) return context.l10n.nameValidatorValue;
  return null;
}

String? priceValidator(BuildContext context, dynamic value) {
  if (value.toString().contains(",")) {
    return context.l10n.priceValidatorDotComma;
  }
  if (value == null || value == "") {
    return context.l10n.percentValidatorValue;
  }
  if (value != null && value != "") {
    if (double.parse(value) <= 0) {
      return context.l10n.percentValidatorValue;
    }
  }

  return null;
}

String? percentValidator(BuildContext context, dynamic value) {
  if (value.toString().contains(",")) {
    return context.l10n.priceValidatorDotComma;
  }
  if (value == null || value == "") {
    return context.l10n.percentValidatorValue;
  }
  if (value != null && value != "") {
    if (double.parse(value) <= 0) {
      return context.l10n.percentValidatorValue;
    }
  }

  return null;
}
