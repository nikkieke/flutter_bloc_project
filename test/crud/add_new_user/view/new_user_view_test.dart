import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../app/helper.dart';

void main(){
  late AddNewUserBloc addNewUserBloc;

  const mockNewUser = NewUser();


  setUp(() {
    addNewUserBloc = MockAddNewUserBloc();
  });

  group('NewUserView', () {
      testWidgets('renders NewUserWidget', (widgetTester)async{
      when(()=> addNewUserBloc.state).thenReturn(AddNewUserInitial());
      await widgetTester.pumpApp(
        addNewUserBloc: addNewUserBloc,
        child:  const NewUserView(),
      );
      expect(find.byType(NewUserWidget), findsOneWidget);
    });
  });

  group('NewUserWidget', () {
    testWidgets('renders CircularProgressIndicator when loading', (widgetTester)async{
      when(()=> addNewUserBloc.state).thenReturn(AddNewUserLoading());
      await widgetTester.pumpApp(
        addNewUserBloc: addNewUserBloc,
        child:  const Material(child: NewUserWidget()),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders a dialog widget when AddNewUser is successful', (widgetTester)async{
      when(()=> addNewUserBloc.state).thenReturn(const AddNewUserLoaded(newUser: mockNewUser));
      await widgetTester.pumpApp(
            addNewUserBloc: addNewUserBloc,
            child: Material(child: NewUserDialog(state: addNewUserBloc.state)),
          );
      expect(find.byType(Dialog,), findsOneWidget);
    });

  });


}