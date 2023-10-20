import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coins_datils_controller.dart';

class CoinsDatilsView extends GetView<CoinsDatilsController> {
  const CoinsDatilsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CoinsDatilsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CoinsDatilsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
