part of 'add_new_user_bloc.dart';

abstract class AddNewUserEvent extends Equatable {
  const AddNewUserEvent();
}

class AddNewUser extends AddNewUserEvent{
  const AddNewUser(this.name, this.job);

  final String name;
  final String job;

  @override
  List<Object?> get props => [name, job];
}
