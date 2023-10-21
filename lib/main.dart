import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_its_uda/counter/counter_page.dart';
import 'package:flutter_course_its_uda/pokemon_detail/pokemon_detail_page.dart';
import 'package:flutter_course_its_uda/pokemon_list/data/entities/pokemon_list_response.dart';
import 'package:flutter_course_its_uda/pokemon_list/presentation/pokemon_list_page.dart';

import 'firebase_options.dart';

void main() {
  runZoned(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application',
      initialRoute: 'login',
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
          case PokemonDetailPage.routeName:
            return MaterialPageRoute(
              builder: (context) => PokemonDetailPage(
                item: settings.arguments as PokemonListItem,
              ),
            );
          case 'login':
            return MaterialPageRoute(
              builder: (context) => SignInScreen(
                providers: [
                  EmailAuthProvider(),
                ],
                actions: [
                  AuthStateChangeAction<SignedIn>((context, state) {
                    Navigator.pushReplacementNamed(context, PokemonListPage.routeName);
                  }),
                ],
              ),
            );
        }
        return null;
      },
    );
  }
}
