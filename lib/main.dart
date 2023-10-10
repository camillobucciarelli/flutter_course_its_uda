import 'package:flutter/material.dart';
import 'package:flutter_course_its_uda/counter/counter_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Application',
      initialRoute: CounterPage.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case CounterPage.routeName:
            return MaterialPageRoute(
              builder: (context) => const CounterPage(),
            );
        }
      },
    );
  }
}
