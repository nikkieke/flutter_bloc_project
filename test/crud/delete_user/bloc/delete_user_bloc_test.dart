import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCrudService extends Mock implements CrudService{}

void main() {
  late MockCrudService mockCrudService;
  const id = '1';
  
  setUp(() {
    mockCrudService = MockCrudService();
  });

  group('DeleteUserBloc', () {
    test('initial state is DeleteUserInitial', () {
      expect(DeleteUserBloc(crudService: mockCrudService).state,
          DeleteUserInitial()
      );
    });

    blocTest<DeleteUserBloc, DeleteUserState>(
        'emits DeleteUserLoading, DeleteUserLoaded when delete is successful',
        setUp: ()=> when(() => (mockCrudService.deleteUser(id))).thenAnswer((_) async => {}),
        build: () => DeleteUserBloc(crudService: mockCrudService),
        act: (bloc){
          bloc.add(const DeleteUser(id));
        },
        expect: ()=> <DeleteUserState>[DeleteUserLoading(), DeleteUserLoaded()],
        verify: (_){
          verify(()=> mockCrudService.deleteUser(id)).called(1);
        }
    );
  });
}
