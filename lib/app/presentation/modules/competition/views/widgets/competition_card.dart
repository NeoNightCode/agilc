import 'package:flutter/material.dart';

import '../../../../../domain/models/competition/competition.dart';

class CompetitionCard extends StatelessWidget {
  const CompetitionCard({
    Key? key,
    required this.competition,
    required this.height,
  }) : super(key: key);

  final double height;
  final Competition competition;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Flexible(
                  child: Text(
                    '${competition.name} ${competition.edition}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '${competition.category} ${competition.classification}',
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
