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
      'emits [ GetUserLoading,GetUserError ] when loading fails',
      setUp: ()=> when(mockCrudService.getUser).thenThrow(Exception()),
      build: () => GetUserBloc(crudService: mockCrudService),
      act: (bloc) => bloc.add(GetUser()),
      expect: () => <GetUserState>[GetUserLoading(), GetUserError()],
      verify: (_)=> verify(mockCrudService.getUser).called(1),
    );

    blocTest<GetUserBloc, GetUserState>(
      'emits [ GetUserLoading,GetUserLoaded ]  when loaded successfully',
      setUp: ()=> when(mockCrudService.getUser).thenAnswer((_)async => const User()),
      build: () => GetUserBloc(crudService: mockCrudService),
      act: (bloc) => bloc.add(GetUser()),
      expect: () => <GetUserState>[GetUserLoading(), const GetUserLoaded()],
      verify: (_)=> verify(mockCrudService.getUser).called(1),
    );
  });
}