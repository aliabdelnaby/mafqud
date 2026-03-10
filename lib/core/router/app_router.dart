import 'package:go_router/go_router.dart';
import 'package:mafqud/features/onBoarding/presentation/views/onboarding_view.dart.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnboardingView(),
    ),
  ],
);