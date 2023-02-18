import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/data/models/favorite/favorite_model.dart';
import 'package:crypto_price/src/modules/favorite/bloc/favorite_event.dart';
import 'package:crypto_price/src/utils/dialogs/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../bloc/favorite_bloc.dart';
import '../bloc/favorite_state.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int? lengt;
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
          return (state is FavoriteInitialState ||
              state is FavoriteStartData ||
              state is FavoriteRefreshData);
        },
        builder: (context, state) {
          Widget content = Container();

          if (state is FavoriteStartData) {
            content = _getContent(state);
          } else if (state is FavoriteRefreshData) {
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

  Widget _getContent(state) {
    debugPrint(state.items.length.toString());
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
          Column(
            children: [
              const Text(
                "There is nothing in there", //TODO:: design
              ),
              CircleAvatar(
                radius: 130,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      150,
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.asset("assets/images/nothing.jpg")),
              )
            ],
          ),
      ],
    );
  }

  _getWidget(BuildContext context, int index, FavoriteModel item) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        BlocProvider.of<FavoriteBloc>(context).add(RemoveItemEvent(item));
        DialogUtils.showSnackbar(context, "hata",
            "Record was deleted succesfully", SnackBarType.succes);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 20, 24, 10),
        child: Container(
          height: 240,
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
                              imageUrl: item.crypto.icon == " " ||
                                      item.crypto.icon == null
                                  ? "assets/images/placeholder_coin.jpg"
                                  : item.crypto.icon!,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return SizedBox(
                                  height: 80,
                                  child: Image.asset(
                                    "assets/images/placeholder_coin.png",
                                    fit: BoxFit.fill,
                                    height: 120,
                                    width: 120,
                                  ),
                                );
                              },
                            )),
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
                        left: 7,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.crypto.name,
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.sackDollar,
                                  color: AppColors.blueColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
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
                                          .toStringAsFixed(3)
                                      : item.priceResult!.expectingProfit
                                          .toStringAsFixed(3),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                                Text(
                                  item.priceResult != null ? " \$" : " %",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blueColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.price_change_sharp,
                                  color: AppColors.blueColor,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
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
                                          .toStringAsFixed(3)
                                      : item.priceResult!.currentRange
                                          .toStringAsFixed(3),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
                                ),
                                const Text(
                                  " \$",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red,
                                  ),
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
                padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: MediaQuery.of(context).size.width / 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.blueColor,
                    ),
                    const Text(
                      "Selling price:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item.percentResult != null
                          ? item.percentResult!.lastPrice.toStringAsFixed(3)
                          : item.priceResult!.lastPrice.toStringAsFixed(3),
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
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.blueColor,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_filled,
                      color: AppColors.blueColor,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    const Text(
                      "Created time:",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      item.createdTime != null
                          ? DateFormat('dd-MM-yyyy – kk:mm')
                              .format(item.createdTime!)
                          : "",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doNothing(BuildContext context) {}
}
