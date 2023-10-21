import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/data_sources/pokemon_firestore_data_source.dart';

import '../../../pokemon_detail/pokemon_detail_page.dart';
import '../../data/entities/pokemon_list_response.dart';
import '../state/pokemon_list_cubit.dart';

class PokemonListItemWidget extends StatelessWidget {
  final PokemonListItem item;
  final bool isLiked;

  const PokemonListItemWidget(this.item, {super.key, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: item.id,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              PokemonDetailPage.routeName,
              arguments: item,
            );
          },
          child: Container(
              width: 350,
              height: 350,
              clipBehavior: Clip.antiAlias,
              decoration: _mainContainerDecoration(),
              child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.all(20),
                decoration: _overlayContainerDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () => likePokemon(context),
                        icon: Icon(
                          isLiked
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: Colors.red,
                          size: 30,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      item.name.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void likePokemon(BuildContext context) async {
    final dataSource = PokemonFirestoreDataSource();
    if (isLiked) {
      await dataSource.removeLikedPokemon(
        FirebaseAuth.instance.currentUser!.uid,
        item.id,
      );
    } else {
      await dataSource.addLikedPokemon(
        FirebaseAuth.instance.currentUser!.uid,
        item.id,
      );
    }
    // ignore: use_build_context_synchronously
    context.read<PokemonListCubit>().initListPage();
  }

  BoxDecoration _overlayContainerDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.5),
          Colors.white.withOpacity(0.0),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
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
