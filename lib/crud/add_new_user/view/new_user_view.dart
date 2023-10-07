import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/add_new_user/bloc/bloc.dart';
import 'view.dart';

class NewUserView extends StatelessWidget {
  const NewUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AddNewUserBloc(crudService: ),
        child: const SafeArea(
          child: NewUser(),
        ),
      ),
    );
  }
}
