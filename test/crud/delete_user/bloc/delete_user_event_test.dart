import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

void main(){
  group('DeleteUserEvent', () {
    group('DeleteUser', () {
      const String id = '1';
      test('supports value comparison', (){
        expect(const DeleteUser(id), const DeleteUser(id));
      });

    });
  });
}