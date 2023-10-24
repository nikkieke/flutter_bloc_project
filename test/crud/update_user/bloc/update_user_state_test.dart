import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

class FakeNewUser extends Fake implements NewUser{}

void main(){
  group('UpdateUserState', () {

    group('UpdateUserInitial', () {
      test('supports value comparison', () {
        expect(UpdateUserInitial(), UpdateUserInitial());
      });

      group('UpdateUserLoading', () {
        test('supports value comparison', () {
          expect(UpdateUserLoading(), UpdateUserLoading());
        });

        group('AddNewUserLoaded', () {
          final newUser = FakeNewUser();
          test('supports value comparison',(){
            expect(UpdateUserLoaded(newUser: newUser), UpdateUserLoaded(newUser: newUser));
          });
        });
      });
    });
  });
}
