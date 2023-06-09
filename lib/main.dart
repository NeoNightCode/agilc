import 'dart:ui' as ui;

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/data/http/http.dart';
import 'app/data/repositories_implementation/account_repository_impl.dart';
import 'app/data/repositories_implementation/authentication_repository_impl.dart';
import 'app/data/repositories_implementation/competition_repository_impl.dart';
import 'app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'app/data/repositories_implementation/last_matchups_repository_impl.dart';
import 'app/data/repositories_implementation/preferences_repository_impl.dart';
import 'app/data/repositories_implementation/team_repository_impl.dart';
import 'app/data/services/local/access_token_service.dart';
import 'app/data/services/local/secret_salt_provider.dart';
import 'app/data/services/remote/account_service.dart';
import 'app/data/services/remote/authentication_service.dart';
import 'app/data/services/remote/competition_service.dart';
import 'app/data/services/remote/internet_checker.dart';
import 'app/data/services/remote/last_matchups_service.dart';
import 'app/data/services/remote/team_service.dart';
import 'app/domain/repositories/account_repository.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/repositories/competition_repository.dart';
import 'app/domain/repositories/connectivity_repository.dart';
import 'app/domain/repositories/last_matchups_repository.dart';
import 'app/domain/repositories/preferences_repository.dart';
import 'app/domain/repositories/team_repository.dart';
import 'app/my_app.dart';
import 'app/presentation/global/controllers/session_controller.dart';
import 'app/presentation/global/controllers/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final secretSaltProvider = SecretSaltProvider(
    const FlutterSecureStorage(),
  );
  await secretSaltProvider.fetchSecretSalt('6rJ8mP2kLxGz9nQ5vAeT7cB');

  final accessTokenService = AccessTokenService(
    const FlutterSecureStorage(),
  );
  final http = Http(
    client: Client(),
    baseUrl: 'https://api.guanxemc.net',
    apiKey: '1B37-98BK-8L5J-H5A4-TK00-3V13',
  );
  final accountService = AccountService(http);
  final systemDarkMode = ui.window.platformBrightness == Brightness.dark;

  final preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        Provider<PreferencesRepository>(create: (_) {
          return PreferencesRepositoryImpl(
            preferences,
          );
        }),
        Provider<AccountRepository>(create: (_) {
          return AccountRepositoryImpl(
            accountService,
            accessTokenService,
          );
        }),
        Provider<ConnectivityRepository>(create: (_) {
          return ConnectivityRepositoryImpl(
            Connectivity(),
            InternetChecker(),
          );
        }),
        Provider<AutheticationRepository>(create: (_) {
          return AutheticationRepositoryImpl(
            AuthenticationService(http),
            accessTokenService,
            accountService,
          );
        }),
        Provider<TeamRepository>(create: (_) {
          return TeamRepositoryImpl(
            TeamService(http),
          );
        }),
        Provider<LastMatchupsRepository>(create: (_) {
          return LastMatchupsRepositoryImpl(
            LastMatchupsService(http),
          );
        }),
        Provider<CompetitionRepository>(create: (_) {
          return CompetitionRepositoryImpl(
            CompetitionService(http),
          );
        }),
        ChangeNotifierProvider<SecretSaltProvider>(
          create: (_) {
            return secretSaltProvider;
          },
        ),
        ChangeNotifierProvider<SessionController>(
          create: (context) => SessionController(
            autheticationRepository: context.read(),
          ),
        ),
        ChangeNotifierProvider<ThemeController>(
          create: (context) {
            final PreferencesRepository preferencesRepository = context.read();
            return ThemeController(
              preferencesRepository.darkMode ?? systemDarkMode,
              preferencesRepository: preferencesRepository,
            );
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}
