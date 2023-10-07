part of 'add_new_user_bloc.dart';

abstract class AddNewUserState extends Equatable {
  const AddNewUserState();
}

class AddNewUserInitial extends AddNewUserState {
  @override
  List<Object> get props => [];
}

class AddNewUserLoading extends AddNewUserState {
  @override
  List<Object> get props => [];
}

class AddNewUserLoaded extends AddNewUserState {
  const AddNewUserLoaded({this.newUser = const NewUser()});

  final NewUser newUser;
  @override
  List<Object> get props => [newUser];
}
