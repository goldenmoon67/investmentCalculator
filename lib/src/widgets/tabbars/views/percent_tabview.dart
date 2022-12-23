import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/modules/home/bloc/home_screen_bloc.dart';
import 'package:crypto_price/src/utils/validators/input_validators.dart';
import 'package:crypto_price/src/widgets/inputs/slider.dart';
import 'package:crypto_price/src/widgets/inputs/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PercentTabView extends StatefulWidget {
  final TextEditingController percentController;
  const PercentTabView({
    Key? key,
    required this.percentController,
  }) : super(key: key);

  @override
  State<PercentTabView> createState() => _PercentTabViewState();
}

class _PercentTabViewState extends State<PercentTabView> {
  bool wannaMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.greyColor,
              borderRadius: BorderRadius.circular(8)),
          child: wannaMore == false
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Desired profit margin"),
                    ),
                    const SliderWidget(),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: InkWell(
                            onTap: () {
                              wannaMore = true;
                              BlocProvider.of<HomeScreenBloc>(context).add(
                                SetWhichPercent(wannaMore),
                              );
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("More than 100% ?"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.greyColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: TextForm(
                        inputAction: TextInputAction.next,
                        prefixIcon: const Icon(Icons.percent),
                        controller: widget.percentController,
                        inputType: TextInputType.number,
                        label: "Profit Rate You Want",
                        validator: ((value) {
                          return percentValidator(context, value);
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.blueColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: InkWell(
                            onTap: () {
                              wannaMore = false;
                              BlocProvider.of<HomeScreenBloc>(context).add(
                                SetWhichPercent(wannaMore),
                              );
                              setState(() {});
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Go back to stick"),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
      ],
    );
  }
}
