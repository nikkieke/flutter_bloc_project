import 'package:flutter/material.dart';

class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children:  [
                const Text("POST", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold,),),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Enter name'),
                  //controller: provider.nameCtr,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(hintText: 'Enter job'),
                  //controller: provider.jobCtr,
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                    onPressed: ()async{
                      // await provider.createNewUser();
                      // if(mounted){
                      //   showDialog(
                      //       context: context,
                      //       builder: (context) => NewUserDialog(provider: provider,));
                      // }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: const Text("Create User", style: TextStyle(color: Colors.white, fontSize: 16),),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}