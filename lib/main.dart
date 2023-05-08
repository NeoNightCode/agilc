import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'app/data/http/http.dart';
import 'app/data/repositories_implementation/authentication_repository_impl.dart';
import 'app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'app/data/services/local/secret_salt_provider.dart';
import 'app/data/services/remote/authentication_service.dart';
import 'app/data/services/remote/internet_checker.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/repositories/connectivity_repository.dart';
import 'app/my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final secretSaltProvider = SecretSaltProvider();
  await secretSaltProvider.fetchSecretSalt('6rJ8mP2kLxGz9nQ5vAeT7cB');
  runApp(
    MultiProvider(
      providers: [
        Provider<ConnectivityRepository>(create: (_) {
          return ConnectivityRepositoryImpl(
            Connectivity(),
            InternetChecker(),
          );
        }),
        Provider<AutheticationRepository>(create: (_) {
          return AutheticationRepositoryImpl(
            const FlutterSecureStorage(),
            AuthenticationService(
              Http(
                client: http.Client(),
                baseUrl: 'https://api.guanxemc.net',
                apiKey: '1B37-98BK-8L5J-H5A4-TK00-3V13',
              ),
            ),
          );
        }),
        ChangeNotifierProvider<SecretSaltProvider>(
          create: (_) {
            return secretSaltProvider;
          },
        )
      ],
      child: const MyApp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
  });

  @override
  // ignore: avoid_renaming_method_parameters
  bool updateShouldNotify(_) => false;

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'Injector could not be found');
    return injector!;
  }
}
