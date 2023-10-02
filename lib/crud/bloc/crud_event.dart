part of 'crud_bloc.dart';


abstract class CrudEvent extends Equatable {
  const CrudEvent();
}

///These are the different events that we will be carrying out, notice that in
///the events class we pass those properties that will be needed for the events
///to be carried out

class DefaultCrud extends CrudEvent{
  @override
  List<Object?> get props => [];

}

class CreateUser extends CrudEvent{
  const CreateUser(this.name, this.job);

  final String name;
  final String job;

  @override

  List<Object?> get props => [name, job];

}

class UpdateUser extends CrudEvent {
  const UpdateUser(this.id, this.job, this.name);
  final String id;
  final String job;
  final String name;

  @override
  List<Object?> get props => [id, job, name];

}

class DeleteUser extends CrudEvent{
  const DeleteUser(this.id);

  final String id;
  @override
  List<Object?> get props => [id];
}

class GetUser extends CrudEvent{
  @override
  List<Object?> get props => [];
}

