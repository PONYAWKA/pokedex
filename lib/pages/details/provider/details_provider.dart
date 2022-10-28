import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/core.dart';

final detailsProvider =
    FutureProvider.family<PokemonDetails, String>((ref, name) async {
  final response = await PokedexRepository(pokedexApi: PokedexApi()).getPokemonDetails(name);
  return response;
});
