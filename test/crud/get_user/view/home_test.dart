import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:mocktail/mocktail.dart';

import '../../../app/helper.dart';

void main(){
  late GetUserBloc getUserBloc;

  setUp(() {
    getUserBloc = MockGetUserBloc();
  });

group('homepage', () {
  testWidgets('renders UserProfile', (widgetTester)async{
    when(()=> getUserBloc.state).thenReturn(GetUserLoading());
    await widgetTester.pumpApp(
        getUserBloc: MockGetUserBloc(),
        child:  const HomePage(),
    );
    expect(find.byType(UserProfile), findsOneWidget);
  });
  
  group('userprofile', () {
    testWidgets('renders CircularProgressIndicator when loading', (widgetTester)async{
      when(()=> getUserBloc.state).thenReturn(GetUserLoading());
      await widgetTester.pumpApp(
          getUserBloc: MockGetUserBloc(),
          child:  const UserProfile(),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

});
}