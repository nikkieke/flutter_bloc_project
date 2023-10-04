part of 'get_user_bloc.dart';

abstract class GetUserEvent extends Equatable {
  const GetUserEvent();
}

///These are the different events that we will be carrying out, notice that in
///the events class we pass those properties that will be needed for the events
///to be carried out

class GetUser extends GetUserEvent{
  @override
  List<Object?> get props => [];
}
