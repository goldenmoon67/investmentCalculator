import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/widgets/components/result_screen_components/investment_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
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
          return (state is FavoriteInitialState || state is FavoriteStartData);
        },
        builder: (context, state) {
          Widget content = Container();

          if (state is FavoriteStartData) {
            debugPrint("budayiz");

            content = _getContent(state);
          }
          return Scaffold(
            backgroundColor: Colors.white,
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

  Widget _getContent(FavoriteStartData state) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 2 / 3,
      child: ListView.builder(
        itemBuilder: (context, index) {
          var item = state.items[index];
          return _getWidget(
              context,
              index,
              item ??
                  FavoriteModel(
                      crypto: Crypto(icon: "", name: "", symbol: ""),
                      priceResult: null,
                      percentResult: null));
        },
        itemCount: 2,
      ),
    );
  }

  _getWidget(BuildContext context, int index, FavoriteModel item) {
    return InvestmentItem(
      cryptoSymbol: item.crypto.symbol,
      cryptoName: item.crypto.name,
      howMuch: 3,
      currentRange: 3,
      investmentItemType: InvestmentItemType.price,
      imageUrl: item.crypto.icon ?? "",
    );
  }
}
