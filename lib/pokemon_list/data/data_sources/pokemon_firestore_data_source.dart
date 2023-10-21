import 'package:cloud_firestore/cloud_firestore.dart';

class PokemonFirestoreDataSource {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  PokemonFirestoreDataSource();


  Future<bool> addLikedPokemon(String uid, String pokemonId) async {
    try {
      await firestore.collection('users').doc(uid).collection('liked_pokemons').doc(pokemonId).set({});
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> removeLikedPokemon(String uid, String pokemonId) async {
    try {
      await firestore.collection('users').doc(uid).collection('liked_pokemons').doc(pokemonId).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<String>> getLikedPokemons(String uid) async {
    try {
      final likedPokemons = await firestore.collection('users').doc(uid).collection('liked_pokemons').get();
      return likedPokemons.docs.map((e) => e.id).toList();
    } catch (e) {
      return [];
    }
  }
}