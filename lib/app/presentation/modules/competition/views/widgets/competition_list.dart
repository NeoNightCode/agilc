import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global/widgets/request_failed.dart';
import '../../../home/controller/state/home_state.dart';
import '../../controller/competition_controller.dart';
import 'competition_card.dart';

class CompetitionList extends StatelessWidget {
  const CompetitionList({super.key});

  @override
  Widget build(BuildContext context) {
    final CompetitionController controller = context.watch();
    final competitions = controller.state;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Competiciones',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Center(
            child: competitions.when(
              loading: (_) => const CircularProgressIndicator(),
              failed: (_) => RequestFailed(onRetry: () {
                controller.loadCompetitions(
                  const LastMatchupsState.loading(),
                );
              }),
              loaded: (_, list) => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemBuilder: (_, index) {
                  final competition = list[index];
                  return CompetitionCard(
                    height: 100,
                    competition: competition,
                  );
                },
                itemCount: list.length,
                separatorBuilder: (_, int index) => const SizedBox(height: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
