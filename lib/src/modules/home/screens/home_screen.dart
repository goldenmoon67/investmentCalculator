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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      create: (context) => HomeScreenBloc()..add(HomeScreenStartEvent()),
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
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
          return (state is HomeScreenInitial ||
              state is PriceCalculateData ||
              state is PercentCalculateData);
        },
        builder: (context, state) {
          Widget content = getInitial(context);
          return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: content,
          );
        },
      ),
    );
  }

  Widget getInitial(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
      child: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              TabbarWidget(tabController: _tabController),
              const SizedBox(
                height: 30,
              ),
              TextForm(
                inputAction: TextInputAction.next,
                prefixIcon: const SizedBox(),
                controller: _textEditingController,
                inputType: TextInputType.name,
                label: "Investment name",
                validator: ((value) {
                  return nameValidator(context, value);
                }),
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
            ],
          ),
        ),
      ),
    );
  }

  void _onPressForPercent(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
    bool valid = formKey.currentState!.validate();
    if (valid) {
      final String name = _textEditingController.text;
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
