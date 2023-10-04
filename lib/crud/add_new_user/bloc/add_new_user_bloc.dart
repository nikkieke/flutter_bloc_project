import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_new_user_event.dart';
part 'add_new_user_state.dart';

class AddNewUserBloc extends Bloc<AddNewUserEvent, AddNewUserState> {
  AddNewUserBloc() : super(AddNewUserInitial()) {
    on<AddNewUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
