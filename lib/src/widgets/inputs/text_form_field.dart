import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? Function(String? value)? validator;
  final TextInputType inputType;
  final Widget prefixIcon;
  final TextInputAction inputAction;
  const TextForm(
      {Key? key,
      required this.controller,
      required this.label,
      required this.validator,
      required this.inputType,
      required this.prefixIcon,
      required this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        keyboardType: inputType,
        textInputAction: inputAction,
        decoration: InputDecoration(
          fillColor: AppColors.greyColor,
          prefixIcon: prefixIcon,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(
              8,
            ),
          ),
          labelText: label,
          labelStyle: const TextStyle(color: Colors.black),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyColor,
              width: 0.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        validator: validator);
  }
}
