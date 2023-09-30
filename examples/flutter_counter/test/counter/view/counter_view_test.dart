import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterCubit extends MockCubit<int> implements CounterCubit{}

const _incrementButtonKey = Key('Counter view increment floating action button');
const _decrementButtonKey = Key('Counter view decrement floating action button');


void main(){
  late CounterCubit counterCubit;
  
  setUp(() => counterCubit = MockCounterCubit());
  
  group('CounterView', () {
    testWidgets('renders current CounterCubit state', (tester) async{
      when(()=> counterCubit.state).thenReturn(42);
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
              value: counterCubit,
              child: CounterView(),
          ),
        )
      );
      expect(find.text('42'), findsOneWidget);
    });

    testWidgets('tapping the increment button invokes increment', (tester) async{
      when(()=> counterCubit.state).thenReturn(0);
      when(()=> counterCubit.increment()).thenReturn(null);
      await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: CounterView(),
            ),
          )
      );

      await tester.tap(find.byKey(_incrementButtonKey));
      verify(()=> counterCubit.increment()).called(1);

    });

    testWidgets('tapping the increment button invokes decrement', (tester) async{
      when(()=> counterCubit.state).thenReturn(0);
      when(()=> counterCubit.decrement()).thenReturn(null);
      await tester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: counterCubit,
              child: CounterView(),
            ),
          )
      );

      final decrementFinder = find.byKey(_decrementButtonKey);
      await tester.ensureVisible(decrementFinder);
      await tester.tap(decrementFinder);
      verify(()=> counterCubit.decrement()).called(1);

    });
  });
}