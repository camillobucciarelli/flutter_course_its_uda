// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonListResponse _$PokemonListResponseFromJson(Map<String, dynamic> json) =>
    PokemonListResponse(
      json['count'] as int,
      json['next'] as String,
      json['previous'] as String?,
      (json['results'] as List<dynamic>)
          .map((e) => PokemonListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

PokemonListItem _$PokemonListItemFromJson(Map<String, dynamic> json) =>
    PokemonListItem(
      _pokemonListItemIdFromJson(json['url'] as String),
      json['name'] as String,
    );
