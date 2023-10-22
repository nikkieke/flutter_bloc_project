import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

class FakeUser extends Fake implements User{}

void main(){
  group('GetUserState', () {

    group('GetUserLoading', () {
      test('supports value comparison', () {
        expect(GetUserLoading(), GetUserLoading());
      });

      group('GetUserLoaded', () {
        final user = FakeUser();
        test('supports value comparison',(){
          expect(GetUserLoaded(user: user), GetUserLoaded(user: user));
        });

        group('GetUserError', () {
          test('supports value comparison', (){
            expect(GetUserError(), GetUserError());
          });
        });

      });
    });
  });
}