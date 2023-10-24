import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCrudService extends Mock implements CrudService{}

void main() {
  late MockCrudService mockCrudService;
  const id = '1';
  const name = 'testName';
  const job = 'testJob';
  setUp(() {
    mockCrudService = MockCrudService();
  });

  group('UpdateUserBloc', () {
    test('initial state is UpdateUserInitial', () {
      expect(UpdateUserBloc(crudService: mockCrudService).state,
          UpdateUserInitial()
      );
    });

    blocTest<UpdateUserBloc, UpdateUserState>(
        'emits UpdateUserLoading, UpdateUserLoaded when loading is successful',
        setUp: () {
          when(() => (mockCrudService.updateUser(id, name, job))).
          thenAnswer((_) async => const NewUser());
        },
        build: () => UpdateUserBloc(crudService: mockCrudService),
        act: (bloc){
          bloc.add(const UpdateUser(id, name, job));
        },
        expect: ()=> <UpdateUserState>[UpdateUserLoading(), const UpdateUserLoaded()],
        verify: (_){
          verify(()=> mockCrudService.updateUser(id,name, job)).called(1);
        }
    );
  });
}
