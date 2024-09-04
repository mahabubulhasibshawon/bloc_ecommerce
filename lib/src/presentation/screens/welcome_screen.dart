import 'package:bloc_ecommerce/src/blocs/authentication/login_bloc.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../widgets/widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "let's get started",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BlocConsumer<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.facebook,
                          onPressed: () {}),
                      const Gap(10),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.twitter,
                          onPressed: () => context
                              .read<LoginBloc>()
                              .add(RequestTwitterLogin())),
                      const Gap(10),
                      SocialLoginButton(
                          buttonType: SocialLoginButtonType.google,
                          onPressed: () => context
                              .read<LoginBloc>()
                              .add(RequestGoogleLogin())),
                      const Gap(10),
                    ],
                  ),
                );
              },
              listener: (context, state) {}),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                  TextButton(
                      onPressed: () => context.pushNamed(Routes.SIGNIN_ROUTE),
                      child: Text(
                        'Signin',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimaryContainer),
                      ))
                ],
              ),
              FullWidthButton(
                  buttonText: 'Craete An Account',
                  onTap: () => context.pushNamed(Routes.SIGNUP_ROUTE))
            ],
          )
        ],
      ),
    );
  }
}
