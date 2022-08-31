import 'package:flutter/widgets.dart';

String? nameValidator(BuildContext context, String? value) {
  if (value == null || value.length < 2) return "Please Enter a right name";
  return null;
}

String? priceValidator(BuildContext context, dynamic value) {
  if (value.toString().contains(",")) {
    return "Please use (.) not (,)";
  }
  if (value == null || value == "") {
    return "Please Enter a right price";
  }
  if (value != null && value != "") {
    if (double.parse(value) <= 0) {
      return "Please Enter a right price";
    }
  }

  return null;
}

String? percentValidator(BuildContext context, dynamic value) {
  if (value.toString().contains(",")) {
    return "Please use (.) not (,)";
  }
  if (value == null || value == "") {
    return "Please Enter a right percent number";
  }
  if (value != null && value != "") {
    if (double.parse(value) <= 0) {
      return "Please Enter a right price";
    }
  }

  return null;
}
