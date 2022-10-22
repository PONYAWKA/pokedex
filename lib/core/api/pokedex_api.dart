import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokedex/core/core.dart';

class PokedexApi {
  final Dio _dio =  Dio()..options.baseUrl = 'https://pokeapi.co/api/v2';

  Future<PokemonDetails> getPokemonDetails(String pokemonName) async {
    try {
      final response = await _dio.get('/pokemon/$pokemonName');
      if (response.statusCode == HttpStatus.ok) {
        return PokemonDetails.fromJson(response.data);
      }
      throw Exception('error getting pokemon Details');
    } on DioError catch (e) {
      print(e.message);
      throw Exception('error getting pokemon Details');
    }
  }

  Future<PokemonResponse> getPokemonList({int? offset, int? limit}) async {
    try {
      final response = await _dio.get('/pokemon?limit=$limit&offset=$offset');
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
