import 'package:pokedex/core/core.dart';
import 'package:pokedex/pages/home/provider/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>(
    (ref) => HomeProvider(pokedexApi : PokedexApi())..getPokemonsList());

class HomeProvider extends StateNotifier<HomeState> {

  HomeProvider({required this.pokedexApi}) : super(HomeState()) ;
  final PokedexApi pokedexApi;
  int limit = 20;

  void getPokemonsList() async {
    if (state.status == HomeStatus.loadMore) return;
    try {
      state = state.Update(status: HomeStatus.loadMore);
      PokemonResponse response =
          await PokedexRepository(pokedexApi: pokedexApi).getPokemonList(offset: state.offset);
      state = state.Update(
          data: state.data.append(response),
          status: HomeStatus.success,
          offset: state.offset + limit);
    } catch (e) {
      state = state.Update(
        errorMsg: e.toString(),
        status: HomeStatus.error,
      );
    }
  }

  void UpdatePokemonList() async {
    if (state.status == HomeStatus.loadMore) return;
    try {
      state = state.Update(status: HomeStatus.loading);
      PokemonResponse response = await PokedexRepository(pokedexApi: pokedexApi).getPokemonList(limit: limit);
      state = state.Update(
        data: response,
        status: HomeStatus.success,
      );
    } catch (e) {
      state = state.Update(
        errorMsg: e.toString(),
        status: HomeStatus.error,
      );
    }
  }
}
