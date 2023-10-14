import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../data/entities/pokemon_list_response.dart';

class PokemonListItemWidget extends StatelessWidget {
  final PokemonListItem item;
  const PokemonListItemWidget(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 350,
      clipBehavior: Clip.antiAlias,
      decoration: _mainContainerDecoration(),
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(20),
        decoration: _overlayContainerDecoration(),
        child: Text(
          item.name.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
  }

  BoxDecoration _overlayContainerDecoration() {
    return BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.0),
          ],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
      );
  }

  BoxDecoration _mainContainerDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 20,
          blurStyle: BlurStyle.outer,
          offset: Offset(0, 0),
        )
      ],
      image: DecorationImage(
        image: CachedNetworkImageProvider(item.imageUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
