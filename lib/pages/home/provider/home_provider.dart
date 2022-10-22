import 'package:pokedex/core/core.dart';
import 'package:pokedex/pages/home/provider/home_state.dart';
import 'package:riverpod/riverpod.dart';

final homeProvider =
    StateNotifierProvider<HomeProvider, HomeState>((ref)
    => HomeProvider()..getPokemonsList());

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(HomeState());

  int limit = 20;

  void getPokemonsList() async {
    try {
      PokemonResponse response =
          await PokedexApi().getPokemonList(offset: state.offset);
      state = state.Update(data: response);
    } catch (e) {
      state = state.Update(
        errorMsg: e.toString(),
        status: HomeStatus.error,
      );
    }
  }
}
