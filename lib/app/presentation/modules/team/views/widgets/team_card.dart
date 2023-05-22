import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/team/team.dart';
import '../team_details_view.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({
    Key? key,
    required this.team,
    required this.height,
  }) : super(key: key);

  final double height;
  final Team team;

  @override
  Widget build(BuildContext context) {
    final imageHeight = height * 0.7;
    final imageWidth = height * 0.5;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TeamDetailsView(team: team),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: ExtendedImage.network(
                    team.imagePath,
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
                  child: Text(
                    team.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
