import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {
  final CrudService crudService;
  DeleteUserBloc({required this.crudService}) : super(DeleteUserInitial()) {

    on<DeleteUser>((event, emit) async{
      emit (DeleteUserLoading());
      try{
        await crudService.deleteUser(event.id);
        emit (DeleteUserLoaded());
      }catch(_){
        rethrow;
      }
    });
  }
}
