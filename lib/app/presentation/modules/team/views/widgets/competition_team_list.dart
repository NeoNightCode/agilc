import 'package:flutter/material.dart';

import '../../../../../domain/models/team/team.dart';
import 'team_card.dart';

class CompetitionTeamListView extends StatelessWidget {
  final List<Team> teams;

  const CompetitionTeamListView({super.key, required this.teams});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: teams.length,
      itemBuilder: (context, index) {
        final team = teams[index];
        return TeamCard(
          team: team,
          height: 100,
        );
      },
    );
  }
}
