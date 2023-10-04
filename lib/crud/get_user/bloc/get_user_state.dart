part of 'get_user_bloc.dart';

abstract class GetUserState extends Equatable {
  const GetUserState();
}


///This is the initial state when no event has been started
class GetUserInitial extends GetUserState {
  @override
  List<Object> get props => [];
}

///This is the loading state to show when an event starts
class GetUserLoading extends GetUserState{
  @override

  List<Object?> get props => [];
}

///This is the state to be shown when user data has been gotten
class GetUserLoaded extends GetUserState{
  const GetUserLoaded({required this.user});

  final User user;
  @override
  List<Object?> get props => [user];

}
