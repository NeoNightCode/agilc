import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/repositories/account_repository.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../../domain/repositories/connectivity_repository.dart';
import '../../../../generated/assets.gen.dart';
import '../../../global/controllers/session_controller.dart';
import '../../../global/controllers/theme_controller.dart';
import '../../../routes/routes.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _init();
      },
    );
  }

  Future<void> _init() async {
    final routeName = await () async {
      final ConnectivityRepository connectivityRepository = context.read();
      final AutheticationRepository autheticationRepository = context.read();
      final AccountRepository accountRepository = context.read();
      final SessionController sessionController = context.read();
      final hasInternet = await connectivityRepository.hasInternet;

      if (!hasInternet) {
        return Routes.offline;
      }

      final isSignedIn = await autheticationRepository.isSignedIn;

      if (!isSignedIn) {
        return Routes.signIn;
      }

      final user = await accountRepository.getUserData();

      if (user != null) {
        sessionController.setUser(user);
        return Routes.main; // Updated this line
      }

      return Routes.signIn;
    }();

    if (mounted) {
      _goto(routeName);
    }
  }

  void _goto(String routeName) {
    Navigator.pushReplacementNamed(
      context,
      routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final darkMode = themeController.darkMode;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              darkMode
                  ? Assets.images.agilcLogoDark.path
                  : Assets.images.agilcLogoDark.path,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
