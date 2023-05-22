import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../domain/repositories/authentication_repository.dart';
import '../../global/controllers/theme_controller.dart';
import '../../global/extensions/build_context_ext.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final darkMode = themeController.darkMode;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SwitchListTile(
                    title: const Text('Modo Oscuro'),
                    value: context.darkMode,
                    onChanged: (value) {
                      context.read<ThemeController>().onChanged(value);
                    },
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      context.read<AutheticationRepository>().signOut();
                      SystemChannels.platform.invokeMethod(
                        'SystemNavigator.pop',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: darkMode ? Colors.black : Colors.white,
                      backgroundColor:
                          darkMode ? Colors.grey[300] : Colors.blue,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.logout),
                    label: const Text('Cerrar Sesión'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
