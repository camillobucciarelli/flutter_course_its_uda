import 'package:flutter/material.dart';
import 'package:flutter_course_its_uda/counter/counter_page.dart';
import 'package:flutter_course_its_uda/pokemon_list/presentation/pokemon_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application',
      initialRoute: PokemonListPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CounterPage.routeName:
            return MaterialPageRoute(
              builder: (context) => const CounterPage(),
            );
          case PokemonListPage.routeName:
            return MaterialPageRoute(
              builder: (context) => const PokemonListPage(),
            );
        }
      },
    );
  }
}
