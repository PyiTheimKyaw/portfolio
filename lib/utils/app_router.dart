import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/pages/home_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/pages/resume_page.dart';
import 'package:portfolio/pages/service_page.dart';
import 'package:portfolio/utils/route_constants.dart';

class AppRouter {
  GoRouter router = GoRouter(routes: [
    GoRoute(
      name: RouteConstants.kRouteHome,
      path: '/',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomePage(),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.kRouteService,
      path: '/service',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ServicePage(),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.kRouteResume,
      path: '/resume',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ResumePage(),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.kRouteProjects,
      path: '/projects',
      pageBuilder: (context, state) {
        return buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ProjectsPage(),
        );
      },
    ),
  ]);
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    transitionDuration: const Duration(milliseconds: 800),
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: CurveTween(curve: Curves.easeIn).animate(animation), child: child),
  );
}
