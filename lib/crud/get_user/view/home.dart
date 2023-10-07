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
      body: const SafeArea(child: UserProfile()),
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GetUserBloc, GetUserState>(builder: (context, state) {
      switch (state) {
        case GetUserLoaded():
          return Center(
              child: ListTile(
                tileColor: Colors.black26,
                leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network("${state.user.avatar}")),
                title: Text('${state.user.firstName}'),
                subtitle: Text('${state.user.lastName}'),
              ),
            );
        case GetUserLoading():
          print(state);
          return const Center(child: CircularProgressIndicator());
        case GetUserError():
          return const Text('Something went wrong!');
      }
    });
  }
}
