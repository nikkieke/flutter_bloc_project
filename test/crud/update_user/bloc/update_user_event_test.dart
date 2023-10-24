import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

void main(){
  group('UpdateUserEvent', () {
    group('UpdateUser', () {
      const String id = '1';
      const String name = 'jane';
      const String job = 'student';
      test('supports value comparison', (){
        expect(const UpdateUser(id, name, job), const UpdateUser(id, name,job));
      });

    });
  });
}