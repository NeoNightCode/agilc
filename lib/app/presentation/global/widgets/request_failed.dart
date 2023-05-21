import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';

class RequestFailed extends StatelessWidget {
  const RequestFailed({
    super.key,
    required this.onRetry,
    this.text,
  });

  final VoidCallback onRetry;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Assets.images.error404.image(),
          ),
          Text(text ?? 'Ha ocurrido un error'),
          const SizedBox(height: 5),
          MaterialButton(
            onPressed: onRetry,
            color: Colors.blue,
            child: const Text('Reintentar'),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
