import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';
import 'package:flutter/material.dart';

part 'crud_event.dart';
part 'crud_state.dart';

class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc({required this.crudInterface}) : super(CrudInitial()) {
    on<GetUser>(_onGetUser);
    on<CreateUser>(_onNewUser);
    on<UpdateUser>(_onUpdateUser);
    on<DeleteUser>(_onDeleteUser);
  }
  final CrudInterface crudInterface;

  Future<void> _onGetUser(
      GetUser event,
      Emitter<CrudState> emit,
      ) async{
    emit (CrudLoading());

    final result = await crudInterface.getUser();

    emit(GetUserLoaded(user: result));

  }

  Future<void> _onNewUser(
      CreateUser event,
      Emitter<CrudState> emit,
      ) async{
    emit (CrudLoading());
    final nameCtr = TextEditingController();
    final jobCtr = TextEditingController();
    final result = await crudInterface.addNewUser(nameCtr.text, jobCtr.text);

    emit(NewUserLoaded(newUser: result));

  }

  Future<void> _onUpdateUser(
     UpdateUser event,
     Emitter<CrudState> emit,
  ) async{
    emit (CrudLoading());
    final state = this.state;
    final nameCtr = TextEditingController();
    final idCtr = TextEditingController();
    final jobCtr = TextEditingController();
    if (state is NewUserLoaded){
      final result = await crudInterface.updateUser(idCtr.text, nameCtr.text, jobCtr.text);
      emit(NewUserLoaded(newUser: result));
    }else{
      emit (CrudError());
    }

  }

  Future<void> _onDeleteUser(
      DeleteUser event,
      Emitter<CrudState> emit,
      ) async{
    final state = this.state;
    final idCtr = TextEditingController();
    if (state is NewUserLoaded){
      await crudInterface.deleteUser(idCtr.text);
    }else{
      emit (CrudError());
    }

  }


}






