import 'package:cached_network_image/cached_network_image.dart';
import 'package:crypto_price/src/consts/colors/app_colors.dart';
import 'package:crypto_price/src/data/models/language/language_model.dart';
import 'package:crypto_price/src/l10n/l10n.dart';
import 'package:flutter/material.dart';

class LanguageComponent extends StatelessWidget {
  final List<LanguageModel> languages;

  const LanguageComponent({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          context.l10n.supportedLanguagesTitle,
          style: TextStyle(
            color: AppColors.blueColor,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            context.l10n.supportedLanguagesDesc,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 450,
          child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl: languages[index].countryImage,
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
                        languages[index].countryName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
