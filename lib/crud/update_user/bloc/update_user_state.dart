part of 'update_user_bloc.dart';

abstract class UpdateUserState extends Equatable {
  const UpdateUserState();
}

class UpdateUserInitial extends UpdateUserState {
  @override
  List<Object> get props => [];
}

class UpdateUserLoading extends UpdateUserState{
  @override
  List<Object> get props => [];
}

class UpdateUserLoaded extends UpdateUserState{
   const UpdateUserLoaded({this.newUser = const NewUser()});

   final NewUser newUser;
  @override
  List<Object> get props => [newUser];
}
