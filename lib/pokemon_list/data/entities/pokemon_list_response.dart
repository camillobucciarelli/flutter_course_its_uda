import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pokemon_list_response.g.dart';

@JsonSerializable(createToJson: false)
class PokemonListResponse extends Equatable {
  final int count;
  final String next;
  final String? previous;
  final List<PokemonListItem> results;

  const PokemonListResponse(this.count, this.next, this.previous, this.results);

  factory PokemonListResponse.fromJson(Map<String, dynamic> json) {
    return _$PokemonListResponseFromJson(json);
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}

@JsonSerializable(createToJson: false)
class PokemonListItem extends Equatable {
  @JsonKey(
    name: 'url',
    fromJson: _pokemonListItemIdFromJson
  )
  final String id;
  final String name;

  const PokemonListItem(this.id, this.name);

  factory PokemonListItem.fromJson(Map<String, dynamic> json) {
    return _$PokemonListItemFromJson(json);
  }

  @override
  List<Object?> get props => [id, name];
}

String _pokemonListItemIdFromJson(String url) {
  final splittedUrl = url.split('/');
  return splittedUrl.elementAt(splittedUrl.length - 2);
}