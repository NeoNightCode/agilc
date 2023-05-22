import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/luchador/luchador.dart';

class FighterCard extends StatelessWidget {
  const FighterCard({
    Key? key,
    required this.fighter,
    required this.height,
  }) : super(key: key);

  final double height;
  final Luchador fighter;

  @override
  Widget build(BuildContext context) {
    final imageHeight = height * 0.7;
    final imageWidth = height * 0.5;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ExtendedImage.network(
                  fighter.imagePath,
                  height: imageHeight,
                  width: imageWidth,
                  loadStateChanged: (state) {
                    if (state.extendedImageLoadState == LoadState.loading) {
                      return Container(
                        color: Colors.black12,
                      );
                    }
                    return state.completedWidget;
                  },
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      fighter.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                        height:
                            4), // Espacio entre el nombre y los campos adicionales
                    Text(
                      'Categoría: ${fighter.category}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Clasificación: ${fighter.classification}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
