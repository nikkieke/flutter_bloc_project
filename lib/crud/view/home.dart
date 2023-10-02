import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view.dart';
import 'package:flutter_bloc_project/crud/bloc/bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideDrawer(),
      appBar: AppBar(title: const Text("Get User"),),
      body: BlocBuilder<CrudBloc, CrudState>(
        builder: (context, state) {
          context.read<CrudBloc>().add(GetUser());
          if (state is GetUserLoaded){
            return SafeArea(
              child: Center(
                child: ListTile(
                  // leading: ClipRRect(
                  //     borderRadius: BorderRadius.circular(100),
                  //     child: Image.network("${state.user.avatar} ")
                  // ),
                  title: Text('${state.user.firstName}'),
                  subtitle: Text('${state.user.lastName}'),
                ),
              ),
            );
          }else if(state is CrudLoading){
            return const Center(child: CircularProgressIndicator());
          }else{
            return const Text('something went wrong');
          }
          }
      ),
    );
  }
}


