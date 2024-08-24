import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

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
          Padding(
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
                    onPressed: () {}),
                const Gap(10),
                SocialLoginButton(
                    buttonType: SocialLoginButtonType.google, onPressed: () {}),
                const Gap(10),
              ],
            ),
          ),
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
                      onPressed: ()=>context.pushNamed(Routes.LOGIN_ROUTE),
                      child: Text(
                        'Signin',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                      ))
                ],
              ),
              InkWell(
                onTap: ()=> context.pushNamed(Routes.REGISTER_ROUTE),
                child: Container(
                  height: 60.h,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  child: Center(
                      child: Text(
                    'Create An Account',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onSecondary),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
