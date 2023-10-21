import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_project/crud/delete_user/bloc/bloc.dart';


class DeleteUserView extends StatelessWidget {
  const DeleteUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController id = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text("User Info"),),
      body: Center(
          child: Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: BlocBuilder<DeleteUserBloc, DeleteUserState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const Text("Delete", style: TextStyle(color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,),),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        decoration: const InputDecoration(hintText: 'Enter Id'),
                        controller: id,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                        ),
                          onPressed: () {
                        context.read<DeleteUserBloc>().add(DeleteUser(id.text));
                        const snackBar = SnackBar(
                          content: Text(
                            'User deleted!',
                          ),
                        );
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                          child: const Text("Delete User", style: TextStyle(
                              color: Colors.black, fontSize: 16),)
                      )
                    ],
                  );
                },
              ),
            ),
          )
      ),
    );
  }
}
