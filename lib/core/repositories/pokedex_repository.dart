import 'package:pokedex/core/core.dart';

abstract class AbstractPokedexRepository{
  Future<PokemonResponse> getPokemonList({int? offset, int? limit});
  Future<PokemonDetails> getPokemonDetails(String pokemonName);
}

class PokedexRepository implements AbstractPokedexRepository
{
  PokedexRepository({required pokedexApi})
      : _pokedexApi = pokedexApi;

  final PokedexApi _pokedexApi;
    @override
  Future<PokemonResponse> getPokemonList({int? offset, int? limit}){
      return _pokedexApi.getPokemonList(offset: offset, limit: limit );
    }
  @override
  Future<PokemonDetails> getPokemonDetails(String pokemonName){
    return _pokedexApi.getPokemonDetails(pokemonName);
  }
}