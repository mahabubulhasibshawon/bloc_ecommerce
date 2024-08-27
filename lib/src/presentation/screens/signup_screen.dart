import 'package:bloc_ecommerce/app.dart';
import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/presentation/widgets/full_width_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routes/route_pages.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  if(state is SignupInitial){
                    return Form(
                      key: formkey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller : state.usernameController,
                            decoration: InputDecoration(
                              label: const Text(
                                'Username',
                              ),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                            ),
                            validator: (value){
                              if(value == '' || value == null) {
                                return 'username is required';
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller : state.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              label: const Text('Password'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                            ),
                            validator: (value){
                              if(value == '' || value == null) {
                                return 'password is required';
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                          TextFormField(
                            controller : state.emailController,
                            decoration: InputDecoration(
                              label: const Text('Email'),
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .outlineVariant),
                            ),
                            validator: (value){
                              if(value == '' || value == null) {
                                return 'email is required';
                              }
                              else {
                                return null;
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }
                  else {
                    return Container();
                  }
                },
              ),
            ),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Remeber me',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  BlocBuilder<RememberSwitchCubit, RememberSwitchState>(
                    builder: (context, state) {
                      return Switch(
                          value: state is SwitchChanged ? state.value : true,
                          onChanged: (value) => context
                              .read<RememberSwitchCubit>()
                              .switchToggle(value));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FullWidthButton(
        buttonText: 'Sign Up',
        onTap: () {
          if(formkey.currentState!.validate()){
            print('validate');
          }else {
            print('not validate');
          }
        },
      ),
    );
  }
}
