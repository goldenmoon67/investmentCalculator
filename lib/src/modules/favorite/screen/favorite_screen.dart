import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      create: (context) => FavoriteBloc(),
      child: BlocConsumer<FavoriteBloc, FavoriteScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.blueColor,
                    borderRadius: const BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(50),
                      bottomEnd: Radius.circular(50),
                    )),
                height: MediaQuery.of(context).size.height * 4 / 5,
                child: const Center(
                  child: Icon(
                    Icons.home,
                  ),
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
        },
      ),
    );
  }
}
