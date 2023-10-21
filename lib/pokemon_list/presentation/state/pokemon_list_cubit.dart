import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/data_sources/pokemon_api_data_source.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/data_sources/pokemon_firestore_data_source.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/entities/pokemon_list_response.dart';

part 'pokemon_list_state.dart';

class PokemonListCubit extends Cubit<PokemonListState> {
  final _dataSource = PokemonApiDataSource();
  final _firestoreDataSource = PokemonFirestoreDataSource();

  PokemonListCubit() : super(PokemonListLoading());

  void initListPage() async {
    try {
      final response = await Future.wait([
        _dataSource.getPokemonList(limit: 21),
        _firestoreDataSource.getLikedPokemons(
          FirebaseAuth.instance.currentUser!.uid,
        ),
      ]);
      emit(PokemonListData(
        response[0] as PokemonListResponse,
        response[1] as List<String>,
      ));
    } catch (e) {
      emit(PokemonListFailure());
    }
  }
}
