import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

void main(){
  group('DeleteUserState', () {

    group('DeleteUserInitial', () {
      test('supports value comparison', () {
        expect(DeleteUserInitial(), DeleteUserInitial());
      });

      group('DeleteUserLoading', () {
        test('supports value comparison', () {
          expect(DeleteUserLoading(), DeleteUserLoading());
        });

        group('DeleteUserLoaded', () {
          test('supports value comparison',(){
            expect(DeleteUserLoaded(), DeleteUserLoaded());
          });
        });
      });
    });
  });
}