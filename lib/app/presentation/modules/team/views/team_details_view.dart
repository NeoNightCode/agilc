import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/models/team/team.dart';
import 'widgets/fighter_card.dart';
import 'widgets/person_card.dart';

class TeamDetailsView extends StatelessWidget {
  const TeamDetailsView({Key? key, required this.team}) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del equipo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ExtendedImage.network(team.imagePath),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        team.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Isla: ${team.island}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Listado Luchadores',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: team.fighters.length,
              itemBuilder: (context, index) {
                final fighter = team.fighters[index];
                return FighterCard(
                  fighter: fighter,
                  height: 100,
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Listado Directivos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: team.personnel.length,
              itemBuilder: (context, index) {
                final person = team.personnel[index];
                return PersonCard(
                  person: person,
                  height: 100,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
