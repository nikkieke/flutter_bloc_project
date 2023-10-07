import 'package:flutter/material.dart';
import 'package:flutter_bloc_project/crud/add_new_user/view/view.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 200,
        child: Container(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
                children: [
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Get User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        //Navigator.push(context, MaterialPageRoute(builder:(context)=> const UserList()));
                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Create new user",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder:(context)=> const NewUserView()));

                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Update User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){

                      }
                  ),
                  ListTile(
                      leading: const Icon(Icons.new_label),
                      title: const Text("Delete User",style: TextStyle(
                          color: Colors.white,  fontSize: 15)),
                      onTap: (){

                      }
                  ),
                ]
            )
        )
    );
  }
}