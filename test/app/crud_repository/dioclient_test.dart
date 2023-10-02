import 'package:flutter_bloc_project/app/crud_repository/dioclient.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioClient {}

void main() {
  group('DioClient', () {
    DioClient? dioClient;
    DioMock? dioMock;

    setUp(() {
      dioClient = DioClient();
      dioMock = DioMock();
    });

    test('DioClient instance is created', () {
      final instance2 = DioClient();
      expect(dioClient, equals(instance2));
    });

    test('get method returns data when successful', () async {
      final Map<String, dynamic> fakeResponse = {
        "data": {
          "id": 2,
        },
      };
      when(() => dioMock?.get(any())).thenAnswer((_) async => (fakeResponse));
      final response = await dioClient?.get(Paths.users);

      expect(response?["data"]["id"], fakeResponse["data"]["id"]);
    });

    test('post method returns data when successful', () async {
      final Map<String, dynamic> fakeResponse = {
        "name": "morpheus",
      };

      final response = await dioClient?.post(
        Paths.usersUrl,
        data: {
          'name': 'morpheus',
          'job': 'leader',
        },
      );
      when(() => dioMock?.post(any())).thenAnswer((_) async => (fakeResponse));
      expect(response?['name'], fakeResponse['name']);
    });
    
    test('update method returns data when successful', () async{
      final Map<String, dynamic> fakeResponse = {
        "name": "morpheus",
      };

      final response = await dioClient?.put(
        "${Paths.users}/2",
        data: {
          'name': 'morpheus',
          'job': 'leader',
        },
      );
      when(() => dioMock?.put(any())).thenAnswer((_) async => (fakeResponse));
      expect(response?['name'], fakeResponse['name']);

    });

    test('delete method is successful', () async{
      final response = await dioClient?.delete(
        "${Paths.users}/2"
      );

      expect(response, isEmpty);

    });
  });
}
