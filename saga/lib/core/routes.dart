import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saga/auth/models/user.dart';
import 'package:saga/auth/viewmodels/current_user.dart';
import 'package:saga/auth/views/auth_page.dart';
import 'package:saga/core/views/book_page.dart';
import 'package:saga/core/views/layout_page.dart';
import 'package:saga/core/views/splash_page.dart';
import 'package:saga/explore/views/explore_page.dart';
import 'package:saga/home/views/home_page.dart';
import 'package:saga/library/views/library_page.dart';
import 'package:saga/profile/views/profile_page.dart';
import 'package:saga/reader/views/reader_page.dart';

part 'routes.g.dart';

/// Router for Nexus.
@riverpod
GoRouter router(Ref ref) {
  final refresh = ValueNotifier<AsyncValue<User?>?>(null);

  ref
    ..onDispose(refresh.dispose)
    ..listen(currentUserProvider, (_, next) {
      refresh.value = next;
    });

  return GoRouter(
    routes: $appRoutes,
    initialLocation: const SplashRoute().location,
    refreshListenable: refresh,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final auth = ref.read(currentUserProvider);
      ref.read(currentSessionProvider);

      if (!auth.hasValue) {
        return const SplashRoute().location;
      }

      if (auth.value == null) {
        if (state.matchedLocation.startsWith('/auth')) {
          return null;
        } else {
          return const AuthRoute().location;
        }
      }

      if (state.matchedLocation.startsWith('/auth') ||
          state.matchedLocation == const SplashRoute().location) {
        return const HomeRoute().location;
      }

      return null;
    },
  );
}

/// Route for Splash page.
@TypedGoRoute<SplashRoute>(path: '/')
class SplashRoute extends GoRouteData {
  /// Route for Splash page.
  const SplashRoute();

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: SplashPage());
}

/// Route for Auth page.
@TypedGoRoute<AuthRoute>(path: '/auth')
class AuthRoute extends GoRouteData {
  /// Route for Auth page.
  const AuthRoute();
  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: AuthPage());
}

final _layoutNavigatorKey = GlobalKey<NavigatorState>();

/// Shell route for layout page.
@TypedStatefulShellRoute<LayoutShell>(
  branches: [
    TypedStatefulShellBranch<HomeRouteBranch>(routes: [TypedGoRoute<HomeRoute>(path: '/home')]),
    TypedStatefulShellBranch<LibraryRouteBranch>(
      routes: [TypedGoRoute<LibraryRoute>(path: '/library')],
    ),
    TypedStatefulShellBranch<ExploreRouteBranch>(
      routes: [TypedGoRoute<ExploreRoute>(path: '/explore')],
    ),
    TypedStatefulShellBranch<ProfileRouteBranch>(
      routes: [TypedGoRoute<ProfileRoute>(path: '/profile')],
    ),
  ],
)
class LayoutShell extends StatefulShellRouteData {
  /// Shell route for layout page.
  const LayoutShell();

  @override
  CustomTransitionPage<void> pageBuilder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) => NoTransitionPage(child: LayoutPage(navigationShell));

  /// Navigator key.
  static final $navigatorKey = _layoutNavigatorKey;

  /// Initial location of the shell route.
  static const $initialLocation = 'home';
}

/// Branch data for Home route.
class HomeRouteBranch extends StatefulShellBranchData {
  const HomeRouteBranch();
}

/// Route for Home page.
class HomeRoute extends GoRouteData {
  /// Route for Home page.
  const HomeRoute();
  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: HomePage());
}

/// Branch data for Library route.
class LibraryRouteBranch extends StatefulShellBranchData {
  const LibraryRouteBranch();
}

/// Route for Library page.
class LibraryRoute extends GoRouteData {
  /// Route for Library page.
  const LibraryRoute();
  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: LibraryPage());
}

/// Branch data for Explore route.
class ExploreRouteBranch extends StatefulShellBranchData {
  const ExploreRouteBranch();
}

/// Route for Explore page.
class ExploreRoute extends GoRouteData {
  /// Route for Explore page.
  const ExploreRoute();
  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: ExplorePage());
}

/// Branch data for Profile route.
class ProfileRouteBranch extends StatefulShellBranchData {
  const ProfileRouteBranch();
}

/// Route for Profile page.
class ProfileRoute extends GoRouteData {
  /// Route for Profile page.
  const ProfileRoute();
  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      const NoTransitionPage(child: ProfilePage());
}

/// Route for Book page.
@TypedGoRoute<BookRoute>(path: '/book/:isbn13', routes: [TypedGoRoute<ReaderRoute>(path: 'reader')])
class BookRoute extends GoRouteData {
  /// Route for Book page.
  const BookRoute(this.isbn13);

  /// ISBN13 of the book.
  final String isbn13;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: BookPage(isbn13));
}

/// Route for Reader page.
class ReaderRoute extends GoRouteData {
  /// Route for Reader page.
  const ReaderRoute(this.isbn13);

  /// ISBN13 of the reader.
  final String isbn13;

  @override
  CustomTransitionPage<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(child: ReaderPage(isbn13));
}
