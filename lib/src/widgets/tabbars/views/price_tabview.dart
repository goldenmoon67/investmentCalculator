import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:crypto_price/src/utils/validators/input_validators.dart';
import 'package:crypto_price/src/widgets/inputs/text_form_field.dart';
import 'package:flutter/material.dart';

class PriceTabView extends StatelessWidget {
  final TextEditingController howMuchTextController;
  final TextEditingController expectingProfitController;
  const PriceTabView(
      {Key? key,
      required this.howMuchTextController,
      required this.expectingProfitController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(8)),
          child: TextForm(
            inputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.wallet),
            controller: howMuchTextController,
            inputType: TextInputType.number,
            label: context.l10n.howMany,
            validator: ((value) {
              return priceValidator(context, value);
            }),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(8)),
          child: TextForm(
            inputAction: TextInputAction.done,
            prefixIcon: const Icon(Icons.attach_money_outlined),
            controller: expectingProfitController,
            inputType: TextInputType.number,
            label: context.l10n.desiredEarnings,
            validator: ((value) {
              return priceValidator(context, value);
            }),
          ),
        ),
      ],
    );
  }
}
