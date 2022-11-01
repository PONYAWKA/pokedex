import 'package:pokedex/core/core.dart';

extension PokemonExtension on Pokemon {
  String get id {
    final data = url?.split('/');
    data?.removeLast();
    return data?.last ?? '1';
  }

  String get getImageUrl =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}