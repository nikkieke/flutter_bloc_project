part of 'get_user_bloc.dart';

@immutable
sealed  class GetUserState extends Equatable {
  const GetUserState();
}


///This is the loading state to show when an event starts
class GetUserLoading extends GetUserState{
  @override

  List<Object?> get props => [];
}

///This is the state to be shown when user data has been gotten
class GetUserLoaded extends GetUserState{
  const GetUserLoaded({this.user = const User()});

  final User user;
  @override
  List<Object?> get props => [user];

}

///This is the Error state
class GetUserError extends GetUserState {
  @override
  List<Object> get props => [];
}
