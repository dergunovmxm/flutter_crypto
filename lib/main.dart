import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/repositories/crypto_coins/crypto_coins.dart';
import 'package:get_it/get_it.dart';
import 'crypto_list_app.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoList());
}
