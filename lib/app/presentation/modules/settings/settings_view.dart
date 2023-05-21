import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../global/controllers/theme_controller.dart';
import '../../global/extensions/build_context_ext.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
