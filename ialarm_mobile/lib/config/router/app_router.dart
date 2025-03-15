import 'package:go_router/go_router.dart';
import 'package:ialarm_mobile/presentation/screens/screens.dart';
import 'package:ialarm_mobile/presentation/screens/formulario.dart';

final appRouter = GoRouter(
  initialLocation: '/initial',
  routes: [
    GoRoute(
      name: 'home_screen',
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: 'initial_screen',
      path: '/initial',
      builder: (context, state) => const InitialScreen(),
    ),
    GoRoute(
      name: 'register_screen',
      path: '/register',
      builder: (context, state) => const RegisterScreen(),
    ),
    GoRoute(
      name: 'create_alarm_screen',
      path: '/create_alarm',
      builder: (context, state) => const Formulario(),
    ),
  ],
);