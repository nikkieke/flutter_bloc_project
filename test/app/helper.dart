import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';

class MockGetUserBloc extends MockBloc<GetUserEvent, GetUserState> implements GetUserBloc{}
class MockAddNewUserBloc extends MockBloc<AddNewUserEvent, AddNewUserState> implements AddNewUserBloc{}
class MockUpdateUserBloc extends MockBloc<UpdateUserEvent, UpdateUserState>implements UpdateUserBloc{}
class MockDeleteUserBloc extends MockBloc<DeleteUserEvent, DeleteUserState> implements DeleteUserBloc{}

extension PumpApp on WidgetTester{
  Future<void>pumpApp({
    required Widget child,
    GetUserBloc? getUserBloc,
    AddNewUserBloc? addNewUserBloc,
    UpdateUserBloc? updateUserBloc,
    DeleteUserBloc? deleteUserBloc,
}){
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            if(getUserBloc != null)
              BlocProvider.value(value: getUserBloc)
            else
              BlocProvider(create: (_)=> MockGetUserBloc()),
            if(addNewUserBloc != null)
              BlocProvider.value(value: addNewUserBloc)
            else
              BlocProvider(create: (_)=> MockAddNewUserBloc()),
            if(updateUserBloc != null)
              BlocProvider.value(value: updateUserBloc)
            else
              BlocProvider(create: (_)=> MockUpdateUserBloc()),
            if(deleteUserBloc != null)
              BlocProvider.value(value: deleteUserBloc)
            else
              BlocProvider(create: (_)=> MockDeleteUserBloc()),

          ],
          child: child,
        ),
      )
    );
  }
}