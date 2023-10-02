import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/app/crud_repository/crud_repository.dart';
import 'package:flutter_bloc_project/crud/crud.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.crudInterface}) : super(key: key);

  final CrudInterface crudInterface;

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: crudInterface,
      child: BlocProvider(
          create: (_) => CrudBloc(crudInterface: crudInterface),
          child: const AppView()),
    );
  }
}


class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}