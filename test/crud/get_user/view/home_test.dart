import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../app/helper.dart';


void main(){
  late GetUserBloc getUserBloc;
  const mockUser = User();

  setUp(() {
    getUserBloc = MockGetUserBloc();
  });

group('homepage', () {
  testWidgets('renders UserProfile', (widgetTester)async{
    when(()=> getUserBloc.state).thenReturn(GetUserLoading());
    await widgetTester.pumpApp(
        getUserBloc: getUserBloc,
        child:  const HomePage(),
    );
    expect(find.byType(UserProfile), findsOneWidget);
  });
  
  group('userprofile', () {
    testWidgets('renders CircularProgressIndicator when loading', (widgetTester)async{
      when(()=> getUserBloc.state).thenReturn(GetUserLoading());
      await widgetTester.pumpApp(
          getUserBloc: getUserBloc,
          child:  const UserProfile(),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });
  });

  group('userprofile', () {
    testWidgets('renders error text on getting an error', (widgetTester)async{
      when(()=> getUserBloc.state).thenReturn(GetUserError());
      await widgetTester.pumpApp(
        getUserBloc: getUserBloc,
        child:  const UserProfile(),
      );
      expect(find.text('Something went wrong!'), findsOneWidget);
    });
  });

  group('userprofile', () {
    testWidgets('renders a Column widget with user name when GetUser is successful', (widgetTester)async{
      when(()=> getUserBloc.state).thenReturn(const GetUserLoaded(user: mockUser));
      await mockNetworkImagesFor (()=>
      widgetTester.pumpApp(
        getUserBloc: getUserBloc,
        child:  const UserProfile(),
      ));
      expect(find.byType(Column), findsOneWidget);
    });
  });

});
}