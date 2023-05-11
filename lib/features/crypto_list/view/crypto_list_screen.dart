import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/crypto_coin_tile.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key,
  });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto List'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 15,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          final coinName = 'Testing';
          return CryptoCoinTile(coinName: coinName);
        },
      ),
    );
  }
}

