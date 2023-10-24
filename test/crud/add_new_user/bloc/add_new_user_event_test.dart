import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

void main(){
  group('AddNewUserEvent', () {
    group('AddNewUser', () {
      const String name = 'jane';
      const String job = 'student';
      test('supports value comparison', (){
        expect(const AddNewUser(name, job), const AddNewUser(name,job));
      });

    });
  });
}
