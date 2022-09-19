import 'package:crypto_price/src/data/repositories/calculate_repository_impl.dart';
import 'package:crypto_price/src/data/repositories/crypto_repository_impl.dart';
import 'package:crypto_price/src/data/services/api/calculate_api.dart';
import 'package:crypto_price/src/data/services/api/crypto_api.dart';
import 'package:crypto_price/src/data/services/client/client.dart';
import 'package:crypto_price/src/repositories/calculate_repository.dart';
import 'package:crypto_price/src/repositories/crypto_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;
final setCalculateApi = CalculateApi();
final setCryptoApi = CryptoApi();
final setClient = Client();
setupGetIt() {
  getIt.registerSingleton<CryptoApi>(setCryptoApi);
  getIt.registerSingleton<CalculateApi>(setCalculateApi);

  getIt.registerSingleton<Client>(setClient);

  getIt.registerLazySingleton<CalculateRepositroy>(
      () => CalculateRepositroyImpl());
  getIt.registerLazySingleton<CryptoRepository>(() => CryptoRepositoryImpl());
}
