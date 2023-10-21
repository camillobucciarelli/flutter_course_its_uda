import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/entities/pokemon_list_response.dart';

class PokemonDetailPage extends StatelessWidget {
  static const routeName = 'pokemon-detail';
  final PokemonListItem item;
  const PokemonDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: item.id,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: _mainContainerDecoration(),
        ),
      ),
    );
  }

  BoxDecoration _mainContainerDecoration() {
    return BoxDecoration(
      image: DecorationImage(
        image: CachedNetworkImageProvider(item.imageUrl),
        fit: BoxFit.contain,
      ),
    );
  }
}
