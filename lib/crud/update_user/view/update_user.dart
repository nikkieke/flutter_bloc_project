import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/update_user/bloc/bloc.dart';

class UpdateUserWidget extends StatelessWidget {
  const UpdateUserWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController();
    final TextEditingController name = TextEditingController();
    final TextEditingController job = TextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: BlocBuilder<UpdateUserBloc, UpdateUserState>(
          builder: (context, state) {
            return Column(
              children: [
                const Text("Update", style: TextStyle(color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter id'),
                  controller: id,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter name'),
                  controller: name,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter job'),
                  controller: job,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white
                  ),
                  onPressed: () {
                    context.read<UpdateUserBloc>().add(UpdateUser(id.text, name.text, job.text));
                    if (context.mounted) {
                      showDialog(
                          context: context,
                          builder: (context) =>
                              UpdateUserDialog(state: state,));
                    }
                  },
                  child: state is UpdateUserLoaded? || state is UpdateUserInitial?
                  const Text("Update User",
                    style: TextStyle(color: Colors.black, fontSize: 16),)
                      :const CircularProgressIndicator(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class UpdateUserDialog extends StatelessWidget {
  const UpdateUserDialog({
    super.key,
    required this.state
  });

  final UpdateUserState state;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateUserBloc, UpdateUserState>(
        builder: (context, state) {
          switch (state) {
            case UpdateUserLoaded():
              return Dialog(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black38,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('ID: ${state.newUser.id}'),
                                Text('Name: ${state.newUser.name}'),
                                Text('Job: ${state.newUser.job}'),
                                Text(
                                  'Updated at: ${state.newUser.updatedAt}',
                                )
                              ]
                          )
                      )
                  )
              );
            case UpdateUserLoading():
              return Container();
          }
          return const Text('Something went wrong');
        });
  }
}
