import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/utils/admob/ad_helper.dart';
import 'package:crypto_price/src/utils/dialogs/dialog_utils.dart';
import 'package:crypto_price/src/widgets/components/common_components/not_found_card.dart';
import 'package:crypto_price/src/widgets/components/favorite_screen_components/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int recordCount = 0;
  BannerAd? _bannerAd;
  BannerAd? _bigBannerAd;

  @override
  void initState() {
    _bannerAd = AdHelper.createBannerAd(AdHelper.favScreenBannerAdUnitId);
    _bigBannerAd =
        AdHelper.createBannerAdXL("ca-app-pub-3940256099942544/2934735716");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteBloc()..add(StartEvent()),
      child: BlocConsumer<FavoriteBloc, FavoriteScreenState>(
        listener: (context, state) {
          if (state is FavoriteInitialState) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss(animation: false);
          }
        },
        buildWhen: (previous, state) {
          debugPrint(state.toString());
          return (state is FavoriteInitialState ||
              state is FavoriteStartData ||
              state is FavoriteRefreshData);
        },
        builder: (context, state) {
          Widget content = Container();

          if (state is FavoriteStartData) {
            recordCount = state.items.length;
            content = _getContent(state);
          } else if (state is FavoriteRefreshData) {
            recordCount = state.items.length;
            content = _getContent(state);
          }
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: AppColors.blueColor,
              centerTitle: false,
              automaticallyImplyLeading: false,
              elevation: 0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.l10n.favoriteTabTitle,
                    style: const TextStyle(fontSize: 32),
                  ),
                  recordCount != 0
                      ? Row(
                          children: [
                            Text(
                              context.l10n.recordCountTitle,
                            ),
                            Text(recordCount.toString())
                          ],
                        )
                      : const SizedBox(),
                ],
              ),
              leadingWidth: 30,
              titleSpacing: 30,
              toolbarHeight: 100,
            ),
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: content,
            ),
            resizeToAvoidBottomInset: false,
          );
        },
      ),
    );
  }

  Widget _getContent(state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (state.items.length != 0)
          SizedBox(
            height: MediaQuery.of(context).size.height * 2 / 3,
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var item = state.items[index];
                return _getWidget(
                  context,
                  index,
                  item ??
                      FavoriteModel(
                        crypto: Crypto(
                          icon: "",
                          name: "",
                          symbol: "",
                        ),
                        priceResult: null,
                        percentResult: null,
                        createdTime: DateTime.now(),
                      ),
                );
              },
              itemCount: state.items.length,
            ),
          )
        else
          const NotFoundCard(),
        state.items.length == 0
            ? AdHelper.getBannerAdWidget(_bigBannerAd)
            : AdHelper.getBannerAdWidget(_bannerAd),
      ],
    );
  }

  _getWidget(BuildContext context, int index, FavoriteModel item) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        BlocProvider.of<FavoriteBloc>(context).add(RemoveItemEvent(item));
        DialogUtils.showSnackbar(
          context,
          context.l10n.succesSnackbarTitle,
          context.l10n.recordDeletedMessage,
          SnackBarType.succes,
        );
        setState(() {});
      },
      child: FavoriteCard(item: item),
    );
  }
}
