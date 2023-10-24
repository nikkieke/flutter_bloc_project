import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCrudService extends Mock implements CrudService{}

void main() {
  late MockCrudService mockCrudService;
  const name = 'testName';
  const job = 'testJob';
  setUp(() {
    mockCrudService = MockCrudService();
  });

  group('AddNewUserBloc', () {
    test('initial state is AddNewUserInitial', () {
      expect(AddNewUserBloc(crudService: mockCrudService).state,
          AddNewUserInitial()
      );
    });

    blocTest<AddNewUserBloc, AddNewUserState>(
        'emits AddNewUserLoading, AddNewUserLoaded when loading is successful',
        setUp: () {
          when(() => (mockCrudService.addNewUser(name, job))).
          thenAnswer((_) async => const NewUser());
        },
        build: () => AddNewUserBloc(crudService: mockCrudService),
        act: (bloc){
          bloc.add(const AddNewUser(name, job));
        },
      expect: ()=> <AddNewUserState>[AddNewUserLoading(), const AddNewUserLoaded()],
      verify: (_){
          verify(()=> mockCrudService.addNewUser(name, job)).called(1);
      }
    );
  });
}
