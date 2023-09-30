import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Counter'),),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state){
            return Text("$state", style: textTheme.displayMedium,);

          },
        )
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: const Key("Counter view increment floating action button"),
              child: const Icon(Icons.add),
              onPressed: ()=> context.read<CounterCubit>().increment(),
          ),
          SizedBox(height: 8,),
          FloatingActionButton(
            key: const Key("Counter view decrement floating action button"),
            child: const Icon(Icons.remove),
            onPressed: ()=> context.read<CounterCubit>().decrement(),
          )
        ],
      ),
    );
  }
}
