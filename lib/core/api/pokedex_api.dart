import 'dart:io';
import 'package:dio_http_cache/dio_http_cache.dart';

import 'package:dio/dio.dart';
import 'package:pokedex/core/core.dart';

abstract class AbstractPokedexApi {
  Future<PokemonDetails> getPokemonDetails(String pokemonName);
  Future<PokemonResponse> getPokemonList({int? offset, int? limit});
}


class PokedexApi implements AbstractPokedexApi {
  final Dio _dio = Dio()
    ..options.baseUrl = 'http://pokeapi.co/api/v2'
    ..interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: "http://pokeapi.co/api/v2"))
            .interceptor);

  @override
  Future<PokemonDetails> getPokemonDetails(String pokemonName) async {
    try {
      final response = await _dio.get('/pokemon/$pokemonName',
          options:
              buildCacheOptions(const Duration(days: 7), forceRefresh: true));
      if (response.statusCode == HttpStatus.ok) {
        return PokemonDetails.fromJson(response.data);
      }
      throw Exception('error getting pokemon Details');
    } on DioError catch (e) {
      print(e.message);
      throw Exception('error getting pokemon Details');
    }
  }
  @override
  Future<PokemonResponse> getPokemonList({int? offset, int? limit}) async {
    try {
      final response = await _dio.get('/pokemon?limit=$limit&offset=$offset',
          options:
              buildCacheOptions(const Duration(days: 7), forceRefresh: true));
      if (response.statusCode == HttpStatus.ok) {
        return PokemonResponse.fromJson(response.data);
      }
      throw Exception('error getting pokemon list');
    } on DioError catch (e) {
      print(e.message);
      throw Exception('error getting pokemon list');
    }
  }
}
