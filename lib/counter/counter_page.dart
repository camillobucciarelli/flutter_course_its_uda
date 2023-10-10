import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_course_its_uda/counter/state/counter_cubit.dart';

class CounterPage extends StatelessWidget {
  static const routeName = 'counter';
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocProvider(
        create: (context) => CounterCubit(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocSelector<CounterCubit, CounterState, int>(
              selector: (state) {
                return state.counter;
              },
              builder: (context, counter) {
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 8),
            Builder(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().decrement();
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 8),
                    FloatingActionButton(
                      onPressed: () {
                        context.read<CounterCubit>().increment();
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
