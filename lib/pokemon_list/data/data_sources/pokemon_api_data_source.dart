import 'package:dio/dio.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/entities/pokemon_list_response.dart';
import 'package:retrofit/http.dart';


part 'pokemon_api_data_source.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2')
abstract class PokemonApiDataSource {
  factory PokemonApiDataSource() => _PokemonApiDataSource(Dio());

  @GET('/pokemon')
  Future<PokemonListResponse> getPokemonList({
    @Query('limit') int limit = 20,
    @Query('offset') int offset = 0,
  });
}