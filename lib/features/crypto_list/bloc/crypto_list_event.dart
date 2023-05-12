part of 'crypro_list_bloc.dart';

abstract class CryptoListEvent extends Equatable{}

class LoadCryptoList extends CryptoListEvent {
  LoadCryptoList({
    this.completer
  });

  @override
  List<Object?> get props => [completer];

  final Completer? completer;
}