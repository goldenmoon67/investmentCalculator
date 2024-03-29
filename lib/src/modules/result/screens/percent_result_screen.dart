import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';
import 'package:crypto_price/src/utils/admob/ad_helper.dart';
import 'package:crypto_price/src/utils/dialogs/dialog_utils.dart';
import 'package:crypto_price/src/utils/navigation/router.dart';
import 'package:crypto_price/src/widgets/appbars/result_appbar.dart';
import 'package:crypto_price/src/widgets/buttons/back_to_calculate_button.dart';
import 'package:crypto_price/src/widgets/buttons/save_investment_button.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_title.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/profit_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_item.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/suggestion_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

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
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    AdHelper.createInterstitialAd(AdHelper.saveFavsBannerAdUnitId, (ad) {
      _interstitialAd = ad;
    });
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
            if (_interstitialAd != null) {
              _interstitialAd!.show();
            }
            _route();
          } else if (state is ResultScreenErrorState) {
            DialogUtils.showLimitFullDialog(context);
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
                      ProfitItem(
                        profitType: ProfitType.percent,
                        expectingProfit: percentResult.percentWeWant,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 0,
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
                var model = FavoriteModel(
                  crypto: crypto,
                  percentResult: widget.percentResult,
                  priceResult: null,
                  createdTime: DateTime.now(),
                );
                BlocProvider.of<ResultScreenBloc>(context).add(
                  Save2FavoritesEvent(model),
                );
              }),
              const BackToCalculateButton(),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _route() async {
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    context.router.setRoot(const DashBoardRoute(children: [
      FavoriteRoute(),
    ]));
  }
}
