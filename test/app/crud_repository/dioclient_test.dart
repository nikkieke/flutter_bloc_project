import 'package:flutter_bloc_project/app/crud_repository/dioclient.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements DioClient{}

void main(){


  group('DioClient', () {
    DioClient? dioClient;
    DioMock? dioMock;

    setUp(() {
      dioClient = DioClient();
      dioMock = DioMock();
    });

    test('DioClient instance is created', (){
      final instance2 = DioClient();

      expect(dioClient, equals(instance2));
    });

    test('get method returns data when successful',() async{
      final Map<String, dynamic>fakeResponse = {"Response": "1000"};
      when(()=> dioMock?.get(any())).thenAnswer((_) async => (fakeResponse));
      final response = await dioClient?.get(Paths.users);

      expect(response, fakeResponse);

    });


    
  });
}