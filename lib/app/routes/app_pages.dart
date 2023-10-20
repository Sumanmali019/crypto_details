import 'package:get/get.dart';

import '../modules/coin/bindings/coin_binding.dart';
import '../modules/coin/views/coin_view.dart';
import '../modules/coins_datils/bindings/coins_datils_binding.dart';
import '../modules/coins_datils/views/coins_datils_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.COIN;

  static final routes = [
    GetPage(
      name: _Paths.COIN,
      page: () => CoinView(),
      binding: CoinBinding(),
    ),
    GetPage(
      name: _Paths.COINS_DATILS,
      page: () =>  CoinsDatilsView(),
      binding: CoinsDatilsBinding(),
    ),
  ];
}
