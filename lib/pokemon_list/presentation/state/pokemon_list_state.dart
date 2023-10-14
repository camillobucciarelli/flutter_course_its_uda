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

  const PokemonListData(this.data);

  @override
  List<Object?> get props => [data];
}

class PokemonListFailure extends PokemonListState {
  @override
  List<Object?> get props => [];
}
