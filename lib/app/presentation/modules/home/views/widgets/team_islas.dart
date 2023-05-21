import 'package:flutter/material.dart';

import '../../../../../domain/enums.dart';

class TeamIslas extends StatelessWidget {
  const TeamIslas({
    super.key,
    required this.islas,
    required this.onChanged,
  });
  final Islas islas;
  final void Function(Islas) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          const Text(
            'Listado Equipos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Material(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButton<Islas>(
                  underline: const SizedBox(),
                  isDense: true,
                  value: islas,
                  items: const [
                    DropdownMenuItem(
                      value: Islas.all,
                      child: Text('Todas las Islas'),
                    ),
                    DropdownMenuItem(
                      value: Islas.lanzarote,
                      child: Text('Lanzarote'),
                    ),
                  ],
                  onChanged: (mIslas) {
                    if (mIslas != null && mIslas != islas) {
                      onChanged(mIslas);
                    }
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
  }
}
