import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/router/router.dart';
import 'package:flutter_crypto/theme/theme.dart';

class CryptoList extends StatelessWidget {
  const CryptoList({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto List',
      theme: darkTheme,
      routes: routes,
    );
  }
}
