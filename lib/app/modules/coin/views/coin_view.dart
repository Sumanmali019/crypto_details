import 'package:criptro_details/app/modules/widget/coins_view.dart';
import 'package:criptro_details/app/modules/constImages/imag_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: const Text('Crypto Wikis'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (coinController.coins.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return GetBuilder(
          init: coinController,
          builder: (value) => ListView.builder(
            controller: value.controller,
            itemCount: coinController.coins.length,
            itemBuilder: (context, index) {
              final coin = coinController.coins[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 10, right: 10),
                child: Container(
                  constraints: const BoxConstraints(),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
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
                        return Center(
                          child: LinearProgressIndicator(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            minHeight: 90,
                            backgroundColor: Colors.grey.shade700,
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Colors.grey),
                          ),
                        );
                      }
                    },
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
