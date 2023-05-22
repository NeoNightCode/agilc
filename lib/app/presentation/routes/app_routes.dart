import 'package:flutter/material.dart';

import '../modules/competition/views/competition_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/main_view.dart';
import '../modules/offline/views/offline.view.dart';
import '../modules/settings/settings_view.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/team/views/team_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.signIn: (context) => const SignInView(),
    Routes.main: (context) => const MainView(),
    Routes.home: (context) => const HomeView(),
    Routes.competitions: (context) => const CompetitionView(),
    Routes.teams: (context) => const TeamView(),
    Routes.settings: (context) => const SettingsView(),
    Routes.offline: (context) => const OfflineView(),
  };
}
