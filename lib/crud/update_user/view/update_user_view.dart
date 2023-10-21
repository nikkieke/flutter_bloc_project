import 'package:flutter/material.dart';
import 'view.dart';

class UpdateUserView extends StatelessWidget {
  const UpdateUserView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: UpdateUserWidget(),
      ),
    );
  }
}