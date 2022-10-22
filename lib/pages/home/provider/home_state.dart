import 'package:pokedex/core/core.dart';

enum HomeStatus {
  loading,
  error,
  success,
  loadMore,
  loadMoreError,
}

class HomeState {
  final PokemonResponse data;
  final HomeStatus status;
  final int offset;
  final String errorMsg;

  HomeState({
    this.status = HomeStatus.loading,
    this.data = const PokemonResponse(),
    this.offset = 0,
    this.errorMsg = '',
  });

  HomeState Update({
      PokemonResponse? data,
      HomeStatus? status,
      int? offset,
      String? errorMsg}) {
    return HomeState(
      status: status ?? this.status,
      data: data ?? this.data,
      offset: offset ?? this.offset,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
