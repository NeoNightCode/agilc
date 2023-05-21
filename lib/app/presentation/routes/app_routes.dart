import 'package:flutter/material.dart';

import '../modules/home/views/home_view.dart';
import '../modules/offline/views/offline.view.dart';
import '../modules/profile/profile_view.dart';
import '../modules/sign_in/views/sign_in_view.dart';
import '../modules/splash/views/splash_view.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashView(),
    Routes.signIn: (context) => const SignInView(),
    Routes.home: (context) => const HomeView(),
    Routes.offline: (context) => const OfflineView(),
    Routes.profile: (context) => const ProfileView(),
  };
}
