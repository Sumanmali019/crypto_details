// import 'package:criptro_details/model/coins.dart';
// import 'package:criptro_details/model/coins_details.dart';
// import 'package:criptro_details/service/api/api_conts.dart';
// import 'package:criptro_details/service/api/network_service.dart';
// import 'package:get/get.dart';

// class CoinRepository extends GetxController {
//   final NetworkService _networkController = Get.find<NetworkService>();

//   Future<List<Coin>> getCoins() async {
//     try {
//       final response = await _networkController.get(COINS);
//       if (response.statusCode == 200) {
//         final List<Coin> data = response.data;
//         final coins =
//             data.map((e) => Coin.fromJson(e as Map<String, dynamic>)).toList();
//         return coins;
//       } else {
//         throw 'Error';
//       }
//     } on Exception catch (e) {
//       throw e.toString();
//     }
//   }

//   Future<CoinDetail> getCoinById(String id) async {
//     try {
//       final response = await _networkController.get('$COIN/$id');
//       if (response.statusCode == 200) {
//         final data = response.data;
//         final coin = CoinDetail.fromJson(data);
//         return coin;
//       } else {
//         throw 'Error';
//       }
//     } on Exception catch (e) {
//       throw e.toString();
//     }
//   }
// }
