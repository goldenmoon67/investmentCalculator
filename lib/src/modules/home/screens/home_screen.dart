import 'dart:ui';

import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/modules/result/screens/percent_result_screen.dart';
import 'package:crypto_price/src/modules/result/screens/price_result_screen.dart';
import 'package:crypto_price/src/utils/navigation/router.dart';
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
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
  String investmentName = "";
  List<String> cryptoNameList = [];

  late TabController _tabController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _percentController = TextEditingController();
    _currentRangeController = TextEditingController();
    _howMuchTextController = TextEditingController();
    _expectingProfitController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
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
              withNavBar: true, // OPTIONAL VALUE. True by default.
              pageTransitionAnimation: PageTransitionAnimation.cupertino,
            );
          }
          if (state is PriceCalculateData) {
            AppRouter.pushScreeen(
                context, PriceResultScreen(priceResult: state.resultModel));
          }
        },
        buildWhen: (previous, state) {
          return (state is PriceCalculateData ||
              state is HomeScreenStartData ||
              state is PercentCalculateData);
        },
        builder: (context, state) {
          if (state is HomeScreenStartData) {
            cryptoNameList = state.cryptos;
          }
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
                  height: 80,
                ),
                TabbarWidget(tabController: _tabController),
                const SizedBox(
                  height: 30,
                ),
                Text("Investment"),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DropdownSearch<String>(
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
                    popupProps: PopupProps.modalBottomSheet(
                        modalBottomSheetProps: const ModalBottomSheetProps(
                          barrierDismissible: true,
                          useRootNavigator: true,
                        ),
                        fit: FlexFit.loose,
                        showSearchBox: true,
                        searchFieldProps: TextFieldProps(
                            scrollPadding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom)),
                        constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height / 2)),
                    items: cryptoNameList,
                    onChanged: (value) {
                      investmentName = value.toString();
                    },
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
                    prefixIcon: const Icon(Icons.monetization_on_sharp),
                    controller: _currentRangeController,
                    inputType: TextInputType.number,
                    label: "Current Range Of Investmen",
                    validator: ((value) {
                      return priceValidator(context, value);
                    }),
                  ),
                ),
                Expanded(
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
                CalculateButton(
                  onPress: () {
                    _tabController.index == 0
                        ? _onPressForPercent(context)
                        : _onPressForPrice(context);
                  },
                ),
                SizedBox(
                  height: 200,
                )
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
      final String name = investmentName;
      final double percent = _percentController.text == ""
          ? 0
          : double.parse(_percentController.text);
      final double currentPrice = double.parse(_currentRangeController.text);
      BlocProvider.of<HomeScreenBloc>(context).add(
        CalculateWithPercent(
          name,
          percent,
          currentPrice,
        ),
      );
    }
  }

  _onPressForPrice(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool valid = formKey.currentState!.validate();
    if (valid) {
      final String name = _textEditingController.text;
      final double howMuch = double.parse(_howMuchTextController.text);
      final double currentPrice = double.parse(_currentRangeController.text);
      final double expect = double.parse(_expectingProfitController.text);
      BlocProvider.of<HomeScreenBloc>(context).add(
        CalculateWithPrice(
          name,
          currentPrice,
          howMuch,
          expect,
        ),
      );
    }
  }
}
