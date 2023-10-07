import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';
import 'package:equatable/equatable.dart';

part 'get_user_event.dart';
part 'get_user_state.dart';

class GetUserBloc extends Bloc<GetUserEvent, GetUserState> {
  GetUserBloc({required this.crudService}) : super(GetUserLoading()) {
    on<GetUser>(_onGetUser);

  }

  final CrudService crudService;

  Future<void> _onGetUser(GetUser event, Emitter<GetUserState> emit) async {
    emit(GetUserLoading());
    try {
      final result = await crudService.getUser();
      emit(GetUserLoaded(user: result));
    } catch (_) {
      emit(GetUserError());
    }


  }
}
