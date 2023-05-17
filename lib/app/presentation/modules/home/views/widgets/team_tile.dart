import 'package:flutter/material.dart';

import '../../../../../domain/models/team/team.dart';

class TeamTile extends StatelessWidget {
  const TeamTile({
    super.key,
    required this.team,
    required this.height,
  });
  final Team team;
  final double height;

  @override
  Widget build(BuildContext context) {
    final width = height * 0.95;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Positioned.fill(
              child: Card(
                child: Row(
                  children: <Widget>[
                    Image.network(
                      team.imagePath,
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(
                        width: 10), // Espacio entre la imagen y el texto
                    Text(
                      team.nombre,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16, // Tamaño de la fuente
                        fontWeight:
                            FontWeight.normal, // Peso de la fuente (opcional)
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
