import 'package:criptro_details/app/modules/widget/coins_view.dart';
import 'package:criptro_details/app/modules/constImages/imag_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../../../model/coins_details.dart';
import '../controllers/coin_controller.dart';

class CoinView extends GetView<CoinController> {
  final CoinController coinController = Get.put(CoinController());
  CoinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('Crypto details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (coinController.coins.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: coinController.coins.length,
          itemBuilder: (context, index) {
            final coin = coinController.coins[index];

            return Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.grey.shade700,
              child: FutureBuilder<CoinDetail>(
                future: coinController.fetchCoinsdetailsbyId(coin.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final coinDetail = snapshot.data;
                    final imageUrl = coinDetail?.logo;
                    final coinrank = coinDetail?.rank.toString();
                    final coinName = coinDetail?.name;
                    final coinSymbol = coinDetail?.symbol;
                    final description = coinDetail?.description;
                    return CoinsView(
                      starImage: ImageConst.star,
                      rank: coinrank ?? 'N/A',
                      imgurls: imageUrl ?? 'N/A',
                      name: coinName ?? 'N/A',
                      symbol: coinSymbol ?? 'N/A',
                      discriptions: description ?? 'N/A',
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      }),
    );
  }
}

// class CoinView extends GetView<CoinController> {
//   final CoinController coinController = Get.put(CoinController());
//   CoinView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         title: const Text('Crypto Wiki'),
//         centerTitle: true,
//       ),
//       body: PagedListView<int, CoinDetail>(
//         pagingController: coinController.pagingController,
//         builderDelegate: PagedChildBuilderDelegate<CoinDetail>(
//           itemBuilder: (context, coinDetail, index) {
//             final coin = coinController.coins[index];
//             return Card(
//               shape: const RoundedRectangleBorder(
//                 side: BorderSide(color: Colors.white70, width: 1),
//               ),
//               color: Colors.grey.shade700,
//               child: FutureBuilder<CoinDetail>(
//                 future: coinController.fetchCoinsdetailsbyId(coin.id),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done &&
//                       snapshot.hasData) {
//                     final coinDetail = snapshot.data;
//                     final imageUrl = coinDetail?.logo;
//                     final coinrank = coinDetail?.rank.toString();
//                     final coinName = coinDetail?.name;
//                     final coinSymbol = coinDetail?.symbol;
//                     final description = coinDetail?.description;
//                     return CoinsView(
//                       starImage: ImageConst.star,
//                       rank: coinrank ?? 'N/A',
//                       imgurls: imageUrl ?? 'N/A',
//                       name: coinName ?? 'N/A',
//                       symbol: coinSymbol ?? 'N/A',
//                       discriptions: description ?? 'N/A',
//                     );
//                   } else {
//                     return const Center(
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                       ),
//                     );
//                   }
//                 },
//               ),
//             );
//           },
//           firstPageErrorIndicatorBuilder: (context) {
//             return const Center(
//               child: Text("Failed to load data."),
//             );
//           },
//           noItemsFoundIndicatorBuilder: (context) {
//             return const Center(
//               child: Text("No items found."),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
