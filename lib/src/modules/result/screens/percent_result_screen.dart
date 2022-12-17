import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/modules/favorite/screen/favorite_screen.dart';
import 'package:crypto_price/src/widgets/appbars/result_appbar.dart';
import 'package:crypto_price/src/widgets/buttons/back_to_calculate_button.dart';
import 'package:crypto_price/src/widgets/buttons/save_investment_button.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_title.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/profit_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_text.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../widgets/components/result_screen_components/investment_item.dart';
import '../bloc/result_screen_bloc.dart';

class PercentResultScreen extends StatefulWidget {
  final PercentResult percentResult;
  const PercentResultScreen({Key? key, required this.percentResult})
      : super(key: key);

  @override
  State<PercentResultScreen> createState() => _PercentResultScreenState();
}

class _PercentResultScreenState extends State<PercentResultScreen> {
  late Crypto crypto;
  late PercentResult percentResult;
  @override
  void initState() {
    crypto = widget.percentResult.crypto;
    percentResult = widget.percentResult;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultScreenBloc(),
      child: BlocConsumer<ResultScreenBloc, ResultScreenState>(
        listener: (context, state) {
          if (state is SavedItemData && state.succes) {
            pushNewScreen(
              context,
              screen: const FavoriteScreen(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        },
        builder: (context, state) {
          Widget content = getCalculateData(context);

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
                          investmentItemType: InvestmentItemType.percent),
                      InvestmentItem(
                        investmentItemType: InvestmentItemType.percent,
                        cryptoName: crypto.name,
                        cryptoSymbol: crypto.symbol,
                        currentRange: percentResult.currentRange,
                        imageUrl: crypto.icon ?? "",
                        howMuch: 10,
                      ),
                      const ProfitItem(
                        profitType: ProfitType.percent,
                        expectingProfit: 10,
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
                lastPrice: percentResult.lastPrice,
              ),
              const SizedBox(
                height: 4,
              ),
              SuggestionText(
                cryptoName: crypto.name,
                cryptoSymbol: crypto.symbol,
                lastPrice: percentResult.lastPrice,
              ),
              const SizedBox(
                height: 16,
              ),
              SaveInvestmentButton(onpress: () {
                debugPrint("bastik");
                BlocProvider.of<ResultScreenBloc>(context).add(
                  Save2FavoritesEvent(crypto),
                );
              }),
              const BackToCalculateButton(),
            ],
          ),
        ],
      ),
    );
  }
}
