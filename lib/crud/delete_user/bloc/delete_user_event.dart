part of 'delete_user_bloc.dart';

abstract class DeleteUserEvent extends Equatable {
  const DeleteUserEvent();
}

class DeleteUser extends DeleteUserEvent{
  const DeleteUser(this.id);

  final String id;

  @override
  List<Object?> get props => [id];

}

