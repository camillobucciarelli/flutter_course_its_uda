import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_its_uda/pokemon_list/presentation/state/pokemon_list_cubit.dart';

import 'widget/pokemon_list_item_widget.dart';

class PokemonListPage extends StatelessWidget {
  const PokemonListPage({Key? key}) : super(key: key);

  static const routeName = 'pokemon_list';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // create: (context) => PokemonListCubit()..initListPage(),
      create: (context) {
        final cubit = PokemonListCubit();
        cubit.initListPage();
        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon list'),
        ),
        body: BlocBuilder<PokemonListCubit, PokemonListState>(
          builder: (context, state) {
            if (state is PokemonListLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is PokemonListData) {
              return ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: state.data.results.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return UnconstrainedBox(
                    child: PokemonListItemWidget(state.data.results[index]),
                  );
                },
              );
            }
            return Center(
                child: Column(
              children: [
                const Text('Errore'),
                ElevatedButton(
                  onPressed: context.read<PokemonListCubit>().initListPage,
                  child: const Text('reload'),
                )
              ],
            ));
          },
        ),
      ),
    );
  }
}
