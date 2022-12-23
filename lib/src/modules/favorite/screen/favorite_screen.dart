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
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 100,
                ),
                child: const Text(
                  "",
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
                    ),
              );
            },
            itemCount: state.items.length,
          ),
        ),
      ],
    );
  }

  _getWidget(BuildContext context, int index, FavoriteModel item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
      child: Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 80,
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
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item.crypto.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Desired earnings:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item.percentResult != null
                                    ? item.percentResult!.percentWeWant
                                        .toString()
                                    : item.priceResult!.expectingProfit
                                        .toString(),
                              ),
                              Text(
                                item.priceResult != null ? " \$" : " %",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Purchase price:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item.percentResult != null
                                    ? item.percentResult!.currentRange
                                        .toString()
                                    : item.priceResult!.currentRange.toString(),
                              ),
                              const Text(
                                " \$",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "Created time:",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                item.percentResult != null
                                    ? item.percentResult!.currentRange
                                        .toString()
                                    : item.priceResult!.currentRange.toString(),
                              ),
                              const Text(
                                " \$",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.arrow_forward_ios_outlined),
                  const Text(
                    "Selling price:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    item.percentResult != null
                        ? item.percentResult!.lastPrice.toString()
                        : item.priceResult!.lastPrice.toString(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenColor,
                    ),
                  ),
                  Text(
                    " \$",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
