import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/features/crypto_list/widgets/widgets.dart';
import 'package:flutter_crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  List<CryptoCoin>? _cryptoCoinsList;

  @override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: EdgeInsets.only(top: 15),
              itemCount: _cryptoCoinsList!.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final coin = _cryptoCoinsList![index];
                return CryptoCoinTile(coin: coin);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadCryptoCoins,
        child: Icon(Icons.change_circle_outlined, size: 45,),
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await GetIt.I<AbstractCoinsRepository>().getCoinsList();
    setState(() {});
  }
}
