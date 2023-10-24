import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../app/helper.dart';

void main(){
  late UpdateUserBloc updateUserBloc;

  const mockNewUser = NewUser();

  setUp(() {
    updateUserBloc = MockUpdateUserBloc();
  });

  group('UpdateUserView', () {
    testWidgets('renders UpdateUserWidget', (widgetTester)async{
      when(()=> updateUserBloc.state).thenReturn(UpdateUserInitial());
      await widgetTester.pumpApp(
        updateUserBloc: updateUserBloc,
        child:  const UpdateUserView(),
      );
      expect(find.byType(UpdateUserWidget), findsOneWidget);
    });
  });

  group('UpdateUserView', () {
    testWidgets('renders CircularProgressIndicator when loading', (widgetTester)async{
      when(()=> updateUserBloc.state).thenReturn(UpdateUserLoading());
      await widgetTester.pumpApp(
        updateUserBloc: updateUserBloc,
        child:  const Material(child: UpdateUserWidget()),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders a dialog widget when AddNewUser is successful', (widgetTester)async{
      when(()=> updateUserBloc.state).thenReturn(const UpdateUserLoaded(newUser: mockNewUser));
      await widgetTester.pumpApp(
        updateUserBloc: updateUserBloc,
        child: Material(child: UpdateUserDialog(state: updateUserBloc.state)),
      );
      expect(find.byType(Dialog,), findsOneWidget);
    });

  });


}