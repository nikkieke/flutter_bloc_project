part of 'add_new_user_bloc.dart';

abstract class AddNewUserState extends Equatable {
  const AddNewUserState();
}

class AddNewUserInitial extends AddNewUserState {
  @override
  List<Object> get props => [];
}
