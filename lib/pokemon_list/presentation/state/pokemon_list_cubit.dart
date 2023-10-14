import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/data_sources/pokemon_api_data_source.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/entities/pokemon_list_response.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  final _dataSource = PokemonApiDataSource();
  PokemonListCubit() : super(PokemonListLoading());

  void initListPage() async {
    try {
      final response = await _dataSource.getPokemonList();
      emit(PokemonListData(response));
    } catch(e) {
      emit(PokemonListFailure());
    }
  }
}
