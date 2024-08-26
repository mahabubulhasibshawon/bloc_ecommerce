import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/screens.dart';
part 'routes.dart';

class RoutePages {
  static final ROUTER = GoRouter(
    routes: [
      GoRoute(path: Routes.SPLASH_ROUTE,name: Routes.SPLASH_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: SplashScreen())),
      GoRoute(path: Routes.WELCOME_ROUTE,name: Routes.WELCOME_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: WelcomeScreen())),
      GoRoute(path: Routes.SIGNIN_ROUTE,name: Routes.SIGNIN_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: SigninScreen())),
      GoRoute(path: Routes.SIGNUP_ROUTE,name: Routes.SIGNUP_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: SignupScreen())),
      ShellRoute(
        builder: (context, state, child) => Wrapper(child: child),
          routes: [
        GoRoute(path: Routes.HOME_ROUTE, name: Routes.HOME_ROUTE, pageBuilder: (context, state) =>  const MaterialPage(child: HomeScreen()))
      ])
    ]
  );
}