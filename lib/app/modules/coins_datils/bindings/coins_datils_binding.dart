import 'package:get/get.dart';

import '../controllers/coins_datils_controller.dart';

class CoinsDatilsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoinsDatilsController>(
      () => CoinsDatilsController(),
    );
  }
}
