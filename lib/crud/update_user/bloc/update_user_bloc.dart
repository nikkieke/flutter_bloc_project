import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';


part 'update_user_event.dart';
part 'update_user_state.dart';

class UpdateUserBloc extends Bloc<UpdateUserEvent, UpdateUserState> {
  final CrudService crudService;
  UpdateUserBloc({required this.crudService}) : super(UpdateUserInitial()) {

    on<UpdateUser>((event, emit) async{
      emit (UpdateUserLoading());
      try{
        final result = await crudService.updateUser(event.id, event.name, event.job);
        emit(UpdateUserLoaded(newUser: result));
      }catch (_){
        rethrow;
      }

    });
  }
}
