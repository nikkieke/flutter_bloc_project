import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  UpdateUserBloc() : super(UpdateUserInitial()) {
    on<UpdateUserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
