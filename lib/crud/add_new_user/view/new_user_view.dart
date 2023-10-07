import 'package:flutter/material.dart';
import 'view.dart';

class NewUserView extends StatelessWidget {
  const NewUserView({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: NewUserWidget(),
        ),
    );
  }
}
