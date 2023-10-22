import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc_project/crud/crud.dart';
import 'package:mocktail/mocktail.dart';


class FakeUser extends Fake implements User{}

class MockGetUserBloc extends Mock implements GetUserBloc{}

void main(){
  late GetUserBloc getUserBloc;

  setUp(() {
    getUserBloc = MockGetUserBloc();
  });

group('homepage', () {
  testWidgets('renders UserProfile', (widgetTester)async{

  });

});
}