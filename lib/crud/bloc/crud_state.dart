part of 'crud_bloc.dart';

abstract class CrudState extends Equatable {
  const CrudState();
}
///Notice that in the different states we pass the different responses
///that will be required by each state. For instance, for the [NewUserLoaded]
///class we pass in the [NewUser] class because we know that the [NewUserLoaded]
///state is to return that class.

///This is the initial state when no event has been started
class CrudInitial extends CrudState {
  @override
  List<Object> get props => [];
}

///This is the loading state to show when an event starts
class CrudLoading extends CrudState{
  @override

  List<Object?> get props => [];
}

///This state is to be shown when a new user has been added or updated
class NewUserLoaded extends CrudState{
  const NewUserLoaded({required this.newUser});

  final NewUser newUser;
  @override

  List<Object?> get props => [];
}

///This is the state to be shown when user data has been gotten
class GetUserLoaded extends CrudState{
  const GetUserLoaded({required this.user});

  final User user;
  @override
  List<Object?> get props => [user];

}

class CrudError extends CrudState{
  @override
  List<Object?> get props => [];
}
