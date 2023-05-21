import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global/widgets/request_failed.dart';
import '../../../matchup/views/widgets/matchup_card.dart';
import '../../controller/home_controller.dart';
import '../../controller/state/home_state.dart';

class LastMatchupsList extends StatelessWidget {
  const LastMatchupsList({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final matchups = controller.state.matchups;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Ultimos Enfrentamientos',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Center(
            child: matchups.when(
              loading: () => const CircularProgressIndicator(),
              failed: () => RequestFailed(onRetry: () {
                controller.loadLastMatchups(
                  matchups: const LastMatchupsState.loading(),
                );
              }),
              loaded: (list) => ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemBuilder: (_, index) {
                  final matchup = list[index];
                  return MatchupCard(
                    height: 100,
                    matchup: matchup,
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
