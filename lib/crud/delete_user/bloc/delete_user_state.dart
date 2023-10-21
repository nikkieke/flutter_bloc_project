part of 'delete_user_bloc.dart';

abstract class DeleteUserState extends Equatable {
  const DeleteUserState();
}

class DeleteUserInitial extends DeleteUserState {
  @override
  List<Object> get props => [];
}

class DeleteUserLoading extends DeleteUserState{
  @override
  List<Object> get props => [];
}

class DeleteUserLoaded extends DeleteUserState{
  @override
  List<Object> get props => [];
}
