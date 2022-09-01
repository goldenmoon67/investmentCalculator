import 'package:crypto_price/src/data/repositories/calculate_repository_impl.dart';
import 'package:crypto_price/src/data/services/funcs/client.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;
setupGetIt() {
  final setcont = Client();
  getIt.registerSingleton<Client>(setcont);
  getIt.registerLazySingleton<CalculateRepositroy>(
      () => CalculateRepositroyImpl());
}
