import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/modules/home/bloc/home_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:syncfusion_flutter_sliders/sliders.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return SfSlider(
      activeColor: AppColors.blueColor,
      min: 0.0,
      max: 100.0,
      value: _value,
      interval: 10,
      showTicks: true,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (dynamic value) {
        setState(() {
          _value = value;
          BlocProvider.of<HomeScreenBloc>(context).add(SetSliderValue(value));
        });
      },
    );
  }
}
