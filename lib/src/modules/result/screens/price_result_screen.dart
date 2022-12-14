import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/price_result_model.dart';
import 'package:crypto_price/src/widgets/appbars/result_appbar.dart';
import 'package:crypto_price/src/widgets/buttons/back_to_calculate_button.dart';
import 'package:crypto_price/src/widgets/buttons/save_investment_button.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_title.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/profit_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/result_screen_bloc.dart';

class PriceResultScreen extends StatefulWidget {
  final PriceResult priceResult;
  const PriceResultScreen({Key? key, required this.priceResult})
      : super(key: key);

  @override
  State<PriceResultScreen> createState() => _PriceResultScreenState();
}

class _PriceResultScreenState extends State<PriceResultScreen> {
  late Crypto crypto;
  late PriceResult priceResult;
  @override
  void initState() {
    crypto = widget.priceResult.crypto;
    priceResult = widget.priceResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(crypto.icon);
    Widget content = getCalculateData(context);

    return BlocProvider(
      create: (context) => ResultScreenBloc(),
      child: BlocConsumer<ResultScreenBloc, ResultScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: const ResultAppBar(),
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: content,
          );
        },
      ),
    );
  }

  Widget getCalculateData(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: AppColors.greyColor,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const InvestmentTitle(
                          investmentItemType: InvestmentItemType.price),
                      InvestmentItem(
                        investmentItemType: InvestmentItemType.price,
                        cryptoName: crypto.name,
                        cryptoSymbol: crypto.symbol,
                        currentRange: priceResult.currentRange,
                        howMuch: priceResult.howMuch,
                        imageUrl: crypto.icon ?? "",
                      ),
                      ProfitItem(
                        profitType: ProfitType.price,
                        expectingProfit: priceResult.expectingProfit,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SuggestionItem(
                cryptoName: crypto.name,
                lastPrice: priceResult.lastPrice,
              ),
              const SizedBox(
                height: 4,
              ),
              SuggestionText(
                cryptoName: crypto.name,
                cryptoSymbol: crypto.symbol,
                lastPrice: priceResult.lastPrice,
              ),
              const SizedBox(
                height: 16,
              ),
              SaveInvestmentButton(onpress: () {}),
              const BackToCalculateButton(),
            ],
          ),
        ],
      ),
    );
  }
}
