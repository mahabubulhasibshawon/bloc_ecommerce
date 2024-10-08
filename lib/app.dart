import 'package:bloc_ecommerce/src/blocs/blocs.dart';
import 'package:bloc_ecommerce/src/routes/route_pages.dart';
import 'package:bloc_ecommerce/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'src/data/repoitory/repository.dart';

class BlocEcommerceApp extends StatelessWidget {
  const BlocEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create:(context)=> AuthRepository())
        ],
        child: MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..startSplash()),
        BlocProvider(create: (context) => RememberSwitchCubit()),
        BlocProvider(create: (context)=> LoginBloc(context.read<AuthRepository>())),
        BlocProvider(create: (context)=> SignupBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 360),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp.router(
            theme: const MaterialTheme(TextTheme()).light(),
            darkTheme: const MaterialTheme(TextTheme()).dark(),
            debugShowCheckedModeBanner: false,
            routerConfig: RoutePages.ROUTER,
          );
        },
      ),
    ),);
  }
}
