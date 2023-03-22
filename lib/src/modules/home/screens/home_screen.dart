import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/crypto/crypto.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart';
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart';
import 'package:crypto_price/src/utils/validators/input_validators.dart';
import 'package:crypto_price/src/widgets/buttons/calculate_button.dart';
import 'package:crypto_price/src/widgets/tabbars/tabs/tabbar.dart';
import 'package:crypto_price/src/widgets/inputs/text_form_field.dart';
import 'package:crypto_price/src/widgets/tabbars/views/percent_tabview.dart';
import 'package:crypto_price/src/widgets/tabbars/views/price_tabview.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../utils/admob/ad_helper.dart';
import '../bloc/home_screen_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TextEditingController _textEditingController;
  late TextEditingController _percentController;
  late TextEditingController _currentRangeController;
  late TextEditingController _howMuchTextController;
  late TextEditingController _expectingProfitController;
  Crypto? selectedCrypto;
  late TabController _tabController;
  final formKey = GlobalKey<FormState>();
  BannerAd? _bannerAd;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _percentController = TextEditingController();
    _currentRangeController = TextEditingController();
    _howMuchTextController = TextEditingController();
    _expectingProfitController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _bannerAd = AdHelper.createBannerAd(AdHelper.homeScreenBannerAdUnitId);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _percentController.dispose();
    _currentRangeController.dispose();
    _howMuchTextController.dispose();
    _expectingProfitController.dispose();
    _tabController.dispose();
    _bannerAd?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(HomeScreenStartEvent(context)),
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is HomeScreenInitial) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss(animation: false);
          }
          if (state is PercentCalculateData) {
            pushNewScreen(
              context,
              screen: PercentResultScreen(
                percentResult: state.resultModel,
              ),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
          if (state is PriceCalculateData) {
            pushNewScreen(
              context,
              screen: PriceResultScreen(
                priceResult: state.resultModel,
              ),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
        },
        buildWhen: (previous, state) {
          return (state is PriceCalculateData ||
              state is HomeScreenStartData ||
              state is PercentCalculateData);
        },
        builder: (context, state) {
          Widget content = getInitial(context, state);
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

  Widget getInitial(BuildContext context, state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Center(
        child: Form(
          key: formKey,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                TabbarWidget(tabController: _tabController),
                const SizedBox(
                  height: 10,
                ),
                Text(context.l10n.investment),
                DropdownSearch<Crypto>(
                  asyncItems: (String filter) => state.cryptosFuture,
                  itemAsString: (item) {
                    return item.name + item.symbol;
                  },
                  onChanged: (Crypto? data) {
                    selectedCrypto = data;
                    BlocProvider.of<HomeScreenBloc>(context).add(
                      HomeScreenStartEvent(
                        context,
                      ),
                    );
                  },
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      fillColor: AppColors.greyColor,
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
                      labelText: "",
                      labelStyle: const TextStyle(color: Colors.black),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyColor,
                          width: 0.0,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  dropdownBuilder: (context, selectedItem) {
                    return selectedItem != null
                        ? ListTile(
                            leading: AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl: selectedItem.icon ?? "",
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
                            title: Text(
                              selectedItem.symbol,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            subtitle: Text(
                              selectedItem.name,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          )
                        : Text(context.l10n.dropdownMenuPlaceHolderText);
                  },
                  popupProps: PopupProps.modalBottomSheet(
                    itemBuilder: (context, item, isSelected) {
                      return ListTile(
                        title: Text(
                          item.symbol,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          item.name,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                    modalBottomSheetProps: const ModalBottomSheetProps(
                      barrierDismissible: true,
                      useRootNavigator: true,
                    ),
                    fit: FlexFit.loose,
                    showSearchBox: true,
                    searchFieldProps: TextFieldProps(
                      autocorrect: true,
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ),
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height / 2,
                    ),
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
                    inputAction: TextInputAction.next,
                    prefixIcon: const Icon(
                      Icons.monetization_on_sharp,
                    ),
                    controller: _currentRangeController,
                    inputType: TextInputType.number,
                    label: context.l10n.currentRangeTitleText,
                    validator: ((value) {
                      return priceValidator(context, value);
                    }),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      PercentTabView(
                        percentController: _percentController,
                      ),
                      PriceTabView(
                          howMuchTextController: _howMuchTextController,
                          expectingProfitController: _expectingProfitController)
                    ],
                  ),
                ),
                SizedBox(
                  height: 130,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      CalculateButton(
                        onPress: () {
                          _tabController.index == 0
                              ? _onPressForPercent(context)
                              : _onPressForPrice(context);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AdHelper.getBannerAdWidget(_bannerAd),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressForPercent(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool valid = formKey.currentState!.validate();
    if (valid) {
      final String name = selectedCrypto?.name ?? "";
      final double percent = _percentController.text == ""
          ? 0
          : double.parse(_percentController.text);
      final double currentPrice = double.parse(_currentRangeController.text);
      BlocProvider.of<HomeScreenBloc>(context).add(
        CalculateWithPercent(
          percent,
          currentPrice,
          context,
          name,
        ),
      );
      BlocProvider.of<HomeScreenBloc>(context).add(
        HomeScreenStartEvent(
          context,
        ),
      );
    }
  }

  _onPressForPrice(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool valid = formKey.currentState!.validate();
    if (valid) {
      final String name = selectedCrypto?.name ?? "";

      final double howMuch = double.parse(_howMuchTextController.text);
      final double currentPrice = double.parse(_currentRangeController.text);
      final double expect = double.parse(_expectingProfitController.text);

      BlocProvider.of<HomeScreenBloc>(context).add(
        CalculateWithPrice(
          name,
          currentPrice,
          howMuch,
          expect,
          context,
        ),
      );
      BlocProvider.of<HomeScreenBloc>(context).add(
        HomeScreenStartEvent(
          context,
        ),
      );
    }
  }
}
