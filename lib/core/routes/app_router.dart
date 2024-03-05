import 'package:digital_secure_assignment/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:digital_secure_assignment/features/auth/presentation/views/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit()..fetchUserById(),
        child: const HomeView(),
      ),
    ),
  ],
);
