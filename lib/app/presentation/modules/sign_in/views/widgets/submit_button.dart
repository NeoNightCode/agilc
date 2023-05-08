import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../data/services/local/secret_salt_provider.dart';
import '../../../../../domain/enums/enums.dart';
import '../../../../../domain/repositories/authentication_repository.dart';
import '../../../../routes/routes.dart';
import '../../controller/sign_in_controller.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Provider.of(context);
    if (controller.state.fetching) {
      return const CircularProgressIndicator();
    }
    return MaterialButton(
      onPressed: () {
        final isValid = Form.of(context).validate();
        if (isValid) {
          _submit(context);
        }
      },
      color: Colors.blue,
      child: const Text('Iniciar Sesión'),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final SignInController controller = context.read();

    controller.onFetchingChanged(true);

    final SecretSaltProvider secretSaltProvider = context.read();

    final hashedPassword = secretSaltProvider.hashPassword(
        controller.state.password, secretSaltProvider.secretSalt);

    final result = await context
        .read<AutheticationRepository>()
        .signIn(controller.state.username, hashedPassword);

    if (!controller.mounted) {
      return;
    }

    result.when(
      (failure) {
        controller.onFetchingChanged(false);
        final message = {
          SigInFailure.notFound: 'Usuario no encontrado',
          SigInFailure.unauthorized: 'Contraseña Incorrecta',
          SigInFailure.unknown: 'Error Desconocido',
          SigInFailure.network: 'Sin conección a internet',
        }[failure];
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message!)),
        );
      },
      (user) {
        Navigator.pushReplacementNamed(context, Routes.home);
      },
    );
  }
}
