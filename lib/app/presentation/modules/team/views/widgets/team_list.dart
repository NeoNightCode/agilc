import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/enums.dart';
import '../../../../global/widgets/request_failed.dart';
import '../../controller/state/team_state.dart';
import '../../controller/team_controller.dart';
import 'team_card.dart';

class TeamListView extends StatelessWidget {
  const TeamListView({super.key});

  @override
  Widget build(BuildContext context) {
    final TeamController controller = context.watch();
    final teams = controller.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Equipos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Center(
            child: teams.when(
              loading: (_) => const CircularProgressIndicator(),
              failed: (_) => RequestFailed(onRetry: () {
                controller.loadTeams(
                  TeamState.loading(Islas.all),
                );
              }),
              loaded: (_, list) => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemBuilder: (_, index) {
                  final team = list[index];
                  return TeamCard(
                    height: 100,
                    team: team,
                  );
                },
                itemCount: list.length,
                separatorBuilder: (_, int index) => const SizedBox(height: 5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
