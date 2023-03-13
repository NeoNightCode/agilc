import 'package:flutter/material.dart';

import '../../../../../main.dart';
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
    final injector = Injector.of(context);
    final connectivityRepository = injector.connectivityRepository;
    final hasInternet = await connectivityRepository.hasInternet;

    if (hasInternet) {
      final autheticationRepository = injector.autheticationRepository;
      final isSignedIn = await autheticationRepository.isSignedIn;
      if (isSignedIn) {
        final user = await autheticationRepository.getUserData();
        if (mounted) {
          if (user != null) {
            _goto(Routes.home);
          } else {
            _goto(Routes.signIn);
          }
        }
      } else if (mounted) {
        _goto(Routes.signIn);
      }
    } else {
      _goto(Routes.offline);
    }
  }

  void _goto(String routName) {
    Navigator.pushReplacementNamed(
      context,
      routName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
