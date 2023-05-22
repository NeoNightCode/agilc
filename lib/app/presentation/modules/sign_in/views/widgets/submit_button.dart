import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global/controllers/session_controller.dart';
import '../../../../routes/routes.dart';
import '../../controller/sign_in_controller.dart';

class SubmitButton extends StatelessWidget {
  final String buttonText;
  final Color color;
  final Color textColor;

  const SubmitButton({
    Key? key,
    required this.buttonText,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SignInController controller = Provider.of<SignInController>(context);
    if (controller.state.fetching) {
      return const CircularProgressIndicator();
    }
    return ElevatedButton(
      onPressed: () {
        final isValid = Form.of(context).validate();
        if (isValid == true) {
          _submit(context);
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor,
        backgroundColor: color,
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
      child: Text(buttonText),
    );
  }

  Future<void> _submit(BuildContext context) async {
    final SignInController controller = context.read<SignInController>();

    final result = await controller.submit();

    if (!controller.mounted) {
      return;
    }

    result.when(
      left: (failure) {
        final message = failure.when(
          notFound: () => 'El usuario no existe',
          network: () => 'Sin conexión a Internet',
          unauthorized: () => 'Credenciales incorrectos',
          unknown: () => 'Error desconocido',
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
      },
      right: (user) {
        final SessionController sessionController =
            context.read<SessionController>();
        sessionController.setUser(user);
        Navigator.pushReplacementNamed(
          context,
          Routes.main,
        );
      },
    );
  }
}
