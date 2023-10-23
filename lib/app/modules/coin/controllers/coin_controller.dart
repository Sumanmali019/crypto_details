import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../../model/coins.dart';
import '../../../../model/coins_details.dart';
import '../../../../service/api/api_conts.dart';
import '../../../../service/api/network_service.dart';

class CoinController extends GetxController {
  final NetworkService _networkController = Get.find<NetworkService>();
  static const int itemsPerPage = 6;
  final PagingController<int, CoinDetail> pagingController =
      PagingController(firstPageKey: 1);

  final coins = <Coin>[].obs;
  final coinsdetails = <CoinDetail>[].obs;
  final id = ''.obs;

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      // When the user scrolls, fetch the next page of data.
      paginateData(pageKey);
    });
    super.onInit();
    fetchCoins();
    fetchCoinsdetailsbyId(id.value);
    pagingController.addPageRequestListener((pageKey) {
      paginateData(pageKey);
    });
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
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

  // psginateData(int value) async {
  //   if (value == (coins.length - 3)) {
  //     await fetchCoins();
  //   }
  // }
  
  // Future<void> paginateData(int pageKey) async {
  //   try {
  //     final response = await _networkController.get('$COINS?page=$pageKey');
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = response.data;
  //       final fetchedCoins = data.map((e) => CoinDetail.fromJson(e)).toList();
  //       final isLastPage = fetchedCoins.length < itemsPerPage;
  //       if (isLastPage) {
  //         pagingController.appendLastPage(fetchedCoins);
  //       } else {
  //         pagingController.appendPage(fetchedCoins, pageKey + 1);
  //       }
  //     } else {
  //       throw 'Error';
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<void> paginateData(int pageKey) async {
    try {
      final response = await _networkController.get(COINS);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;

        final start = (pageKey - 1) * itemsPerPage;
        final end = start + itemsPerPage;

        if (start >= data.length) {
          pagingController.appendLastPage([]);
        } else {
          final nextPageData = data.sublist(start, end);

          final fetchedCoins =
              nextPageData.map((e) => CoinDetail.fromJson(e)).toList();

          pagingController.appendPage(fetchedCoins, pageKey + 1);
        }
      } else {
        throw 'Error';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
