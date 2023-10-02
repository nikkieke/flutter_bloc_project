import 'package:dio/dio.dart';

import 'crud_repository.dart';

abstract class CrudInterface{
  Future<User>getUser();
  Future<NewUser>addNewUser(String name, String job);
  Future<NewUser>updateUser(String id, String name, String job);
  Future<void>deleteUser(String id);
}

class CrudService implements CrudInterface{


  @override
  Future<NewUser> addNewUser(String name, String job) async {
    try{
      final response = await DioClient.instance.post(
        Paths.usersUrl,
        data: {
          'name': name,
          'job': job,
        },
      );
      return NewUser.fromJson(response);
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<void> deleteUser(String id) async{
    try{
      await DioClient.instance.delete('${Paths.users}/$id');
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<NewUser> updateUser(String id, String name, String job)async {
    try{
      final response = await DioClient.instance.put(
        '${Paths.users}/$id',
        data: {
          'id': id,
          'name': name,
          'job': job,
        },
      );
      return NewUser.fromJson(response);
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }

  @override
  Future<User> getUser() async{
    try {
      final response = await DioClient.instance.get(Paths.users);
      final user = User.fromJson(response);
      return user;
    }on DioException catch(e){
      var error = DioErrors(e);
      throw error.errorMessage;
    }
  }

}