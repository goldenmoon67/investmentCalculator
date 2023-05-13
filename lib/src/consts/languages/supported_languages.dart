import 'package:crypto_price/src/data/models/language/language_model.dart';

class SupportedLanguages {
  static final List<LanguageModel> _greyColor = [
    const LanguageModel(
        countryName: "England",
        countryCode: "en",
        countryImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Flag_of_the_United_Kingdom_%281-2%29.svg/1200px-Flag_of_the_United_Kingdom_%281-2%29.svg.png"),
    const LanguageModel(
        countryName: "España",
        countryCode: "es",
        countryImage:
            "https://cdn.britannica.com/36/4336-004-6BD81071/Flag-Spain.jpg"),
    const LanguageModel(
        countryName: "France",
        countryCode: "fr",
        countryImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Flag_of_France.svg/1200px-Flag_of_France.svg.png"),
    const LanguageModel(
        countryName: "Italia",
        countryCode: "it",
        countryImage:
            "https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/800px-Flag_of_Italy.svg.png"),
    const LanguageModel(
        countryName: "Portugal",
        countryCode: "pt",
        countryImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Flag_of_Portugal.svg/600px-Flag_of_Portugal.svg.png?20210806190400"),
    const LanguageModel(
        countryName: "Türkiye",
        countryCode: "tr",
        countryImage:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Flag_of_Turkey.svg/800px-Flag_of_Turkey.svg.png"),
  ];

  static getAllLanguages() {
    return _greyColor;
  }

  static LanguageModel getLanguageByIndex(int index) {
    return _greyColor
        .where((element) => _greyColor.indexOf(element) == index)
        .first;
  }
}
