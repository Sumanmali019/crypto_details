import 'package:get/get.dart';
import '../../../../model/coins.dart';
import '../../../../model/coins_details.dart';
import '../../../../service/api/api_conts.dart';
import '../../../../service/api/network_service.dart';

class CoinController extends GetxController {
  final NetworkService _networkController = Get.find<NetworkService>();

  final coins = <Coin>[].obs;
  final coinsdetails = <CoinDetail>[].obs;
  final id = ''.obs;

  int page = 1;
  bool isLoading = false;
  int initialLoadCount = 10;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
    fetchCoinsdetailsbyId(id.value);
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
    } catch (e) {
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
    } catch (e) {
      throw e.toString();
    }
  }
}
