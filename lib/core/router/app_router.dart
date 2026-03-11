import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mafqud/features/auth/cubit/auth_cubit.dart';
import 'package:mafqud/features/auth/presentation/views/login_view.dart';
import 'package:mafqud/features/auth/presentation/views/sign_up_view.dart';

import '../../features/onBoarding/presentation/views/onboarding_view.dart.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => const OnboardingView()),
    GoRoute(
      path: '/loginView',
      builder: (context, state) => BlocProvider(
        create: (context) => AuthCubit(),
        child: const LoginView(),
      ),
    ),
    GoRoute(
      path: '/signUpView',
      builder: (context, state) => const SignUpView(),
    ),
  ],
);
