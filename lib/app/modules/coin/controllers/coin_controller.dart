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
  final int pageSize = 7;
  bool hasNextPage = true;
  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchCoins();
    fetchInitialCoins();
    fetchSingleCoin();
    fetchCoinsdetailsbyId(id.value);
    loadMoreCoins();
  }


  Future<void> fetchInitialCoins() async {
    page = 1;
    isLoading = true;
    try {
      final response =
          await _networkController.get('$COINS?page=$page&pageSize=10');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final fetchedCoins = data.map((e) => Coin.fromJson(e)).toList();
        coins.assignAll(fetchedCoins);
        isLoading = false;
      } else {
        throw 'Error';
      }
    } catch (e) {
      isLoading = false;
      throw e.toString();
    }
  }

  Future<void> fetchSingleCoin() async {
    if (!isLoading) {
      isLoading = true;
      try {
        final response =
            await _networkController.get('$COINS?page=$page&pageSize=1');
        if (response.statusCode == 200) {
          final List<dynamic> data = response.data;
          if (data.isNotEmpty) {
            final fetchedCoin = Coin.fromJson(data.first);
            coins.add(fetchedCoin);
            isLoading = false;
            page++;
          } else {
            isLoading = false;
          }
        } else {
          isLoading = false;
          throw 'Error';
        }
      } catch (e) {
        isLoading = false;
        throw e.toString();
      }
    }
  }

  Future<void> fetchCoins() async {
    if (isLoading) return;

    try {
      final response =
          await _networkController.get('$COINS?page=$page&pageSize=$pageSize');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final fetchedCoins = data.map((e) => Coin.fromJson(e)).toList();
        coins.assignAll(fetchedCoins);
        hasNextPage = fetchedCoins.length == pageSize;
        page++;
      } else {
        throw 'Error';
      }
    } catch (e) {
      throw e.toString();
    } finally {
      isLoading = false;
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

  Future<void> loadMoreCoins() async {
    if (hasNextPage) {
      isLoading = true;
      await fetchCoins();
    }
  }
}
