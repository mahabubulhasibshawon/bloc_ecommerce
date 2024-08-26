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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      label: const Text(
                        'Username',
                      ),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant),
                    ),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text('Email'),
                      labelStyle: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.outlineVariant),
                    ),
                  ),
                  const Gap(20),
                  Row(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: FullWidthButton(
        buttonText: 'Sign Up',
        onTap: () => context.pushNamed(Routes.SIGNUP_ROUTE),
      ),
    );
  }
}
