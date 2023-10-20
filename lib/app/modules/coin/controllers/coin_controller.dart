import 'package:get/get.dart';

import '../../../../model/coins.dart';
import '../../../../model/coins_details.dart';
import '../../../../service/api/api_conts.dart';
import '../../../../service/api/network_service.dart';

class CoinController extends GetxController {
  final NetworkService _networkController = Get.find<NetworkService>();

  final coins = <Coin>[].obs;
  final coinsdetails = <CoinDetail>[].obs;
  late final String? id;

  @override
  void onInit() async {
    super.onInit();
    await fetchCoins();
    await fetchCoinsdetailsbyId(id);
  }

  Future<void> fetchCoins() async {
    try {
      final response = await _networkController.get(COINS);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final fetchedCoins = data.map((e) => Coin.fromJson(e)).toList();
        coins.assignAll(fetchedCoins);
      } else {
        throw 'Error';
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  Future<CoinDetail> fetchCoinsdetailsbyId(String? id) async {
    try {
      final response = await _networkController.get('$COIN/$id');
      if (response.statusCode == 200) {
        final data = response.data;
        final coin = CoinDetail.fromJson(data);
        return coin;
      } else {
        throw 'Error';
      }
    } on Exception catch (e) {
      throw e.toString();
    }
  }
}
