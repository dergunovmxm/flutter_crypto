import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crypto/features/crypto_list/bloc/crypro_list_bloc.dart';
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
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

  @override
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto List'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cryptoListBloc.add(LoadCryptoList(completer: completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
              bloc: _cryptoListBloc,
              builder: (context, state) {
                if (state is CryptoListLoaded) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 15),
                    itemCount: state.coinsList.length,
                    separatorBuilder: (context, index) => Divider(),
                    itemBuilder: (context, index) {
                      final coin = state.coinsList[index];
                      return CryptoCoinTile(coin: coin);
                    },
                  );
                }
                if (state is CryptoListLoadingFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Something went wrong',
                          style: theme.textTheme.headlineMedium,
                        ),
                        Text(
                          'Please try againg later',
                          style: theme.textTheme.labelSmall
                              ?.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        TextButton(
                          onPressed: () {
                            _cryptoListBloc.add(LoadCryptoList());
                          },
                          child: const Text('Try againg'),
                        ),
                      ],
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              })),
    );
  }
}
