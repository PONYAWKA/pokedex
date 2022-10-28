import 'package:pokedex/core/core.dart';

abstract class AbstractPokedexRepository{
  Future<PokemonResponse> getPokemonList({int? offset, int? limit});
  Future<PokemonDetails> getPokemonDetails(String pokemonName);
}

class PokedexRepository implements AbstractPokedexApi
{
  PokedexRepository({PokedexApi? pokedexApi})
      : _pokedexApi = pokedexApi ?? PokedexApi();

  final PokedexApi _pokedexApi;
    Future<PokemonResponse> getPokemonList({int? offset, int? limit}){
      return _pokedexApi.getPokemonList(offset: offset, limit: limit );
    }
  Future<PokemonDetails> getPokemonDetails(String pokemonName){
    return _pokedexApi.getPokemonDetails(pokemonName);
  }
}