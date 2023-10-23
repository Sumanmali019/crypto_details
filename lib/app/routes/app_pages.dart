import 'package:get/get.dart';

import '../modules/coin/bindings/coin_binding.dart';
import '../modules/coin/views/coin_view.dart';

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
   
  ];
}
