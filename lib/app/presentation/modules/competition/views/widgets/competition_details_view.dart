import 'package:flutter/material.dart';

import '../../../../../domain/models/competition/competition.dart';
import '../../../team/views/widgets/competition_team_list.dart';
import 'fixture_group_list.dart';

class CompetitionDetailsView extends StatelessWidget {
  const CompetitionDetailsView({Key? key, required this.competition})
      : super(key: key);

  final Competition competition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                competition.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Edición: ${competition.edition}',
              ),
              Text(
                'Categoría: ${competition.category}',
              ),
              Text(
                'Clasificación: ${competition.classification}',
              ),
              const SizedBox(height: 16),
              const Text(
                'Equipos Participantes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CompetitionTeamListView(teams: competition.teams),
              const SizedBox(height: 16),
              const Text(
                'Listado Jornadas',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FixturesGroupListView(fixtures: competition.fixtures),
            ],
          ),
        ),
      ),
    );
  }
}
