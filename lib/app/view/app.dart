import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/crud.dart';


class App extends StatelessWidget {
  const App({Key? key, required this.crudService}) : super(key: key);

  final CrudService crudService;

  @override
  Widget build(BuildContext context) {

    return RepositoryProvider.value(
      value: crudService,
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) =>  GetUserBloc(crudService: crudService)..add(GetUser()),
            ),
            BlocProvider(
              create: (_) =>  AddNewUserBloc(crudService: crudService),
            ),
            BlocProvider(
              create: (_) =>  UpdateUserBloc(crudService: crudService),
            ),
            BlocProvider(
              create: (_) =>  DeleteUserBloc(crudService: crudService),
            ),
          ],
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