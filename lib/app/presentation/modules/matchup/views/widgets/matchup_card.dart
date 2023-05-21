import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/models/matchup/matchup.dart';
import 'matchup_team.dart';

class MatchupCard extends StatelessWidget {
  const MatchupCard({
    Key? key,
    required this.matchup,
    required this.height,
  }) : super(key: key);

  final double height;
  final Matchup matchup;

  @override
  Widget build(BuildContext context) {
    final imageHeight = height * 0.7;
    final imageWidth = height * 0.5;
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    final String formattedDate = formatter.format(matchup.date);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MatchupTeam(
                  imagePath: matchup.homeTeamImage,
                  teamName: matchup.homeTeam,
                  imageHeight: imageHeight,
                  imageWidth: imageWidth,
                ),
                Flexible(
                  child: Text(
                    '${matchup.results.pointsHomeTeam} - ${matchup.results.pointsAwayTeam}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                MatchupTeam(
                  imagePath: matchup.awayTeamImage,
                  teamName: matchup.awayTeam,
                  imageHeight: imageHeight,
                  imageWidth: imageWidth,
                ),
              ],
            ),
            Text(
              'Fecha: $formattedDate',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
