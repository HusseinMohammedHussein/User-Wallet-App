import 'package:digital_secure_assignment/features/auth/presentation/cubit/login_cubit.dart';
import 'package:digital_secure_assignment/features/auth/presentation/views/login_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    // GoRoute(
    //   path: "/",
    //   builder: (context, state) => const SplashView(),
    // ),
    GoRoute(
      path: "/",
      builder: (context, state) => BlocProvider(
        create: (context) => LoginCubit(),
        child: const LoginView(),
      ),
    ),
  ],
);
