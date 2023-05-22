import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/directivo/directivo.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({
    Key? key,
    required this.person,
    required this.height,
  }) : super(key: key);

  final double height;
  final Directivo person;

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
                  person.imagePath,
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
                      person.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Cargo: ${person.position}',
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
