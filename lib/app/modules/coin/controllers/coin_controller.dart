import 'package:flutter/material.dart';
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
  int listLength = 6;

  List<Coin> list = [];
  ScrollController controller = ScrollController();

  @override
  void onInit() {
    super.onInit();
    generateList();
    fetchCoins();
    addItems();
    fetchCoinsdetailsbyId(id.value);
  }

  generateList() {
    list = List.generate(listLength, (index) => Coin());
  }

  addItems() async {
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        for (int i = 0; i < 2; i++) {
          listLength++;
          list.add(Coin());
          update();
        }
      }
    });
  }

  // Future<void> fetchCoins() async {
  //   try {
  //     final response = await _networkController.get(COINS);
  //     if (response.statusCode == 200) {
  //       final List<dynamic> data = response.data;
  //       final fetchedCoins = data.map((e) => Coin.fromJson(e)).toList();
  //       coins.assignAll(fetchedCoins);
  //     } else {
  //       throw 'Error';
  //     }
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }
  Future<void> fetchCoins() async {
    try {
      final response = await _networkController.get(COINS);
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final fetchedCoins = data.map((e) => Coin.fromJson(e)).toList();
        coins.assignAll(fetchedCoins);
      } else {
        throw 'Error: Non-200 status code';
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
