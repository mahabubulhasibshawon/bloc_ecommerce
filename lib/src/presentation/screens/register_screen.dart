import 'package:bloc_ecommerce/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Sign Up',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Padding(
            padding: EdgeInsets.symmetric( horizontal: 15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(decoration: InputDecoration(
                  label: Text('Username'),
                  hintText: 'Inser your username',
                ),),
                TextField(),
                TextField(),
              ],
            ),
          ),
          Container(
            height: 60.h,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            child: Center(
              child: Text(
                'Sign Up',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
