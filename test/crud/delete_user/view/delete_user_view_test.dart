import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../app/helper.dart';

void main(){
  late DeleteUserBloc deleteUserBloc;
  
  setUp(() {
    deleteUserBloc = MockDeleteUserBloc();
  });
  
  group('DeleteUserView', () { 
    testWidgets('renders a snack bar when delete button is tapped', (widgetTester) async{
      when(()=> deleteUserBloc.state).thenReturn(DeleteUserLoaded());
      await widgetTester.pumpApp(
        deleteUserBloc: deleteUserBloc,
        child:  const Material(child: DeleteUserView()),
      );
      await widgetTester.tap(find.text('Delete User'));
      await widgetTester.pumpAndSettle();
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('User deleted!'), findsOneWidget);

    });
  });
}