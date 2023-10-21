part of 'pokemon_list_cubit.dart';

sealed class PokemonListState extends Equatable {
  const PokemonListState();
}

class PokemonListLoading extends PokemonListState {
  @override
  List<Object> get props => [];
}

class PokemonListData extends PokemonListState {
  final PokemonListResponse data;
  final List<String> likedPokemons;

  const PokemonListData(this.data, this.likedPokemons);

  @override
  List<Object?> get props => [data, likedPokemons];
}

class PokemonListFailure extends PokemonListState {
  @override
  List<Object?> get props => [];
}
