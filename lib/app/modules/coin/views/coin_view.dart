import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        title: const Text('Crypto details '),
        centerTitle: true,
      ),
      body: Obx(() {
        if (coinController.coins.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: coinController.coins.length,
          itemBuilder: (context, index) {
            final coin = coinController.coins[index];
            return ListTile(
              title: Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.blue.shade300,
                    child: Text(
                      coin.rank?.toString() ?? 'N/A',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(coin.name ?? '',
                      style:
                          const TextStyle(color: Colors.white, fontSize: 24)),
                ],
              ),
              subtitle: Text(
                coin.symbol ?? '',
                style: const TextStyle(color: Colors.white),
              ),
              trailing: coin.isActive == true
                  ? Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    )
                  : Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                      ),
                    ),
            );
          },
        );
      }),
    );
  }
}
