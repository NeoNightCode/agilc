import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class MatchupTeam extends StatelessWidget {
  const MatchupTeam({
    Key? key,
    required this.imagePath,
    required this.teamName,
    required this.imageHeight,
    required this.imageWidth,
  }) : super(key: key);

  final String imagePath;
  final String teamName;
  final double imageHeight;
  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          ExtendedImage.network(
            imagePath,
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
          Text(
            teamName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
