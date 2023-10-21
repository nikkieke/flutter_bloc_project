part of 'update_user_bloc.dart';

abstract class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();
}

class UpdateUser extends UpdateUserEvent{
  const UpdateUser(this.id, this.name, this.job);

  final String id;
  final String name;
  final String job;

  @override
  List<Object?> get props => [id, name, job];
}
