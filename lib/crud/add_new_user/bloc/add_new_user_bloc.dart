import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';

part 'add_new_user_event.dart';
part 'add_new_user_state.dart';

class AddNewUserBloc extends Bloc<AddNewUserEvent, AddNewUserState> {
  final CrudService crudService;
  AddNewUserBloc({required this.crudService}) : super(AddNewUserInitial()) {

    on<AddNewUserEvent>((event, emit) async{
      emit(AddNewUserLoading());
      try {
        final result = await crudService.addNewUser(name, job);
        emit(AddNewUserLoaded(newUser: result));
      } catch (_) {
        emit(GetUserError());
      }

    });
  }

}
