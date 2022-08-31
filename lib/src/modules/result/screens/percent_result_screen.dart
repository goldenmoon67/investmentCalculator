import 'package:auto_route/auto_route.dart';
import 'package:crypto_price/src/data/models/result_models/percent_result_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../bloc/result_screen_bloc.dart';

class PercentResultScreen extends StatefulWidget implements AutoRouteWrapper {
  final PercentResult percentResult;
  const PercentResultScreen({Key? key, required this.percentResult})
      : super(key: key);

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultScreenBloc()..add(ResultScreenStartEvent()),
      child: this,
    );
  }

  @override
  State<PercentResultScreen> createState() => _PercentResultScreenState();
}

class _PercentResultScreenState extends State<PercentResultScreen> {
  @override
  Widget build(BuildContext context) {
    Widget content = getCalculateData(context);

    return BlocConsumer<ResultScreenBloc, ResultScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
          body: content,
        );
      },
    );
  }

  Widget getCalculateData(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.blue.shade100,
                Colors.blue.shade400,
                Colors.blue.shade900
              ],
              stops: [
                0.0,
                0.5,
                0.8,
              ],
            )),
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/result.svg",
                    semanticsLabel: 'Result Logo'),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "Investment:"),
                      TextSpan(
                          text: widget.percentResult.investmentName,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: "You bought at:"),
                      TextSpan(
                          text: widget.percentResult.currentRange.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                ShaderMask(
                  blendMode: BlendMode.srcIn,
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Colors.blue.shade900,
                      Colors.grey,
                    ],
                    stops: [
                      0.0,
                      1.0,
                    ],
                  ).createShader(
                    Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                  ),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: "Profit you want:"),
                        TextSpan(
                            text: widget.percentResult.percentWeWant.toString(),
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 24.0,
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      const TextSpan(
                          text: "We suggest you that You should sell it when "),
                      TextSpan(
                          text: widget.percentResult.investmentName,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " = ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.percentResult.lastPrice.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: " to win ",
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: widget.percentResult.percentWeWant.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: "% more ",
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: Text("Save This investment")),
                TextButton(
                  onPressed: () {},
                  child: Text("Back to Main page"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
