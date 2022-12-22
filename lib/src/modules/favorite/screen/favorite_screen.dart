import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
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
            content = _getContent(state);
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: content,
            ),
            resizeToAvoidBottomInset: false,
          );
        },
      ),
    );
  }

  Widget _getContent(FavoriteStartData state) {
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(70)),
              child: Image.asset(
                "assets/images/fav_banner.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 40,
                ),
                child: const Text(
                  "Recorded",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 2 / 3,
          child: ListView.builder(
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
                    ),
              );
            },
            itemCount: 4,
          ),
        ),
      ],
    );
  }

  _getWidget(BuildContext context, int index, FavoriteModel item) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: item.crypto.icon ?? "",
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) {
                            return const Center(
                              child: Icon(
                                Icons.dangerous,
                                color: Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    item.crypto.symbol,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Text(
                    item.crypto.name,
                  ),
                  Row(
                    children: [
                      const Text("Expecting:"),
                      Text(
                        item.percentResult != null
                            ? item.percentResult!.percentWeWant.toString()
                            : item.priceResult!.expectingProfit.toString(),
                      ),
                      Text(
                        item.percentResult != null ? " \$" : " %",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
