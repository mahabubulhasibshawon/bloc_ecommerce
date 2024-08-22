import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/screens/login_screen.dart';
import '../presentation/screens/register_screen.dart';
import '../presentation/screens/splash_screen.dart';
import '../presentation/screens/welcome_screen.dart';
part 'routes.dart';

class RoutePages {
  static final ROUTER = GoRouter(
    routes: [
      GoRoute(path: Routes.SPLASH_ROUTE,name: Routes.SPLASH_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: SplashScreen())),
      GoRoute(path: Routes.WELCOME_ROUTE,name: Routes.WELCOME_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: WelcomeScreen())),
      GoRoute(path: Routes.LOGIN_ROUTE,name: Routes.LOGIN_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: LoginScreen())),
      GoRoute(path: Routes.REGISTER_ROUTE,name: Routes.REGISTER_ROUTE, pageBuilder: (context, state)=> const MaterialPage(child: RegisterScreen())),
    ]
  );
}