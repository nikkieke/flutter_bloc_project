import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockCrudService extends Mock implements CrudService{}

void main(){
  group('get_user bloc', () {
    late MockCrudService mockCrudService;

    setUp(() {
      mockCrudService = MockCrudService();
    });

    test('initial state is get user loading', () {
      expect(GetUserBloc(crudService: mockCrudService).state,
          GetUserLoading()
      );
    });

    blocTest<GetUserBloc, GetUserState>(
      'emits loaded state when loading successfully',
      build: () => GetUserBloc(),
      act: (bloc) {
        // TODO: implement
      },
      expect: () => <GetUserState>[
        // TODO: implement
      ],
    );
  });
}