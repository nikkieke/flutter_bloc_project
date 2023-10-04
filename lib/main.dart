import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_service.dart';
import 'app/view/app.dart';

void main() {
  runApp(App(crudService: CrudService()));
}




