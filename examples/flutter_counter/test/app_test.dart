// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/counter/counter.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('Counter app', () { 
    testWidgets('is a Material App', (tester) async{
      expect(CounterApp(), isA<MaterialApp>());
    });

    testWidgets('home is a CounterPage', (tester) async{
      expect(CounterApp().home, isA<CounterPage>());
    });

    testWidgets('renders CounterPage', (tester) async{
      await tester.pumpWidget(CounterApp());
      expect(find.byType(CounterPage), findsOneWidget);
    });
    
  });

}
