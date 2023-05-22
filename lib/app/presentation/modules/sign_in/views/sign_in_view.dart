import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/assets.gen.dart';
import '../../../global/controllers/theme_controller.dart';
import '../controller/sign_in_controller.dart';
import '../controller/state/sign_in_state.dart';
import 'widgets/submit_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    final darkMode = themeController.darkMode;
    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(
        const SignInState(),
        autheticationRepository: context.read(),
        secretSaltProvider: context.read(),
      ),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(
                    darkMode
                        ? Assets.images.loginDark.path
                        : Assets.images.login.path,
                    height: 200,
                    width: 200,
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Builder(builder: (context) {
                      final controller = Provider.of<SignInController>(context);
                      return AbsorbPointer(
                        absorbing: controller.state.fetching,
                        child: Column(
                          children: [
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (text) {
                                controller.onUsernameChanged(text);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Usuario/Email',
                              ),
                              validator: (text) {
                                text = text?.trim().toLowerCase() ?? '';

                                if (text.isEmpty) {
                                  return 'Usuario o Email no existente';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              onChanged: (text) {
                                controller.onPasswordChanged(text);
                              },
                              obscureText: controller.state.hidePassword,
                              decoration: InputDecoration(
                                hintText: 'Contraseña',
                                suffixIcon: IconButton(
                                  icon: Icon(controller.state.hidePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    controller.togglePasswordVisibility();
                                  },
                                ),
                              ),
                              validator: (text) {
                                text = text?.replaceAll(' ', '') ?? '';

                                if (text.length < 4) {
                                  return 'Contraseña Incorrecta';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SubmitButton(
                                    buttonText: 'Iniciar Sesión',
                                    color:
                                        darkMode ? Colors.white : Colors.blue,
                                    textColor:
                                        darkMode ? Colors.black : Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignInView(), //No me dio tiempo a crear el sistema de register
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: darkMode
                                          ? Colors.black
                                          : Colors.white,
                                      backgroundColor:
                                          darkMode ? Colors.white : Colors.blue,
                                      textStyle: const TextStyle(
                                        fontSize: 12,
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
                                    child: const Text('Registrarse'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
