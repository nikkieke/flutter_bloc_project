import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

class FakeNewUser extends Fake implements NewUser{}

void main(){
  group('AddNewUserState', () {

    group('AddNewUserInitial', () {
      test('supports value comparison', () {
        expect(AddNewUserInitial(), AddNewUserInitial());
      });

      group('AddNewUserLoading', () {
        test('supports value comparison', () {
          expect(AddNewUserLoading(), AddNewUserLoading());
        });

      group('AddNewUserLoaded', () {
        final newUser = FakeNewUser();
        test('supports value comparison',(){
          expect(AddNewUserLoaded(newUser: newUser), AddNewUserLoaded(newUser: newUser));
        });
        });
      });
    });
  });
}
