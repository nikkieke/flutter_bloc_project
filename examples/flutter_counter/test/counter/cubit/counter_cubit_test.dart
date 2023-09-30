import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main (){
  group('counter cubit', (){
    test('initial state is 0', () {
      expect(CounterCubit().state, 0);
    });


  group('increment', () {
    blocTest('emits [1] when state is 0',
        build: CounterCubit.new,
        act: (cubit)=> cubit.increment(),
        expect: ()=> const <int> [1]
    );

    blocTest('emits [1, 2] when state is zero and invoked twice',
        build: CounterCubit.new,
        act: (cubit)=> cubit
              ..increment()
              ..increment(),
        expect: ()=> const <int> [1, 2]

    );

    blocTest('emits [42] when state is [41]',
        build: CounterCubit.new,
        seed: ()=> 41,
        act: (cubit)=> cubit.increment(),
        expect: ()=> const <int> [42]

    );

  });

  group('decrement', () {
    blocTest('emits [-1] when state is 0',
        build: CounterCubit.new,
        act: (cubit)=> cubit.decrement(),
      expect: ()=> const <int> [-1]
    );

    blocTest('emits [-1, -2] when state is zero and invoked twice',
        build: CounterCubit.new,
        act: (cubit)=> cubit
          ..decrement()
          ..decrement(),
        expect: ()=> const <int> [-1, -2]

    );

    blocTest('emits [42] when state is [43]',
        build: CounterCubit.new,
        seed: ()=> 43,
        act: (cubit)=> cubit.decrement(),
        expect: ()=> const <int> [42]

    );

  });

  });

}