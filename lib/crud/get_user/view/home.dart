import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/get_user/bloc/bloc.dart';
import 'view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(
        title: const Text("Get User"),
      ),
      body: BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
        switch (state) {
          case GetUserLoading():
            return const Center(child: CircularProgressIndicator());
          case GetUserLoaded():
            return SafeArea(
              child: Center(
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network("${state.user.avatar} ")),
                  title: Text('${state.user.firstName}'),
                  subtitle: Text('${state.user.lastName}'),
                ),
              ),
            );
          case GetUserError():
            return const Text('Something went wrong!');
        }
        return Container();
      }),
    );
  }
}
