import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/models/team/team.dart';
import '../../../global/widgets/request_failed.dart';
import '../controller/state/team_state.dart';
import '../controller/team_controller.dart';
import 'widgets/team_content.dart';

class TeamDetailsView extends StatelessWidget {
  const TeamDetailsView({Key? key, required this.team}) : super(key: key);

  final Team team;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamController(
        TeamListState.loading(),
        team: team,
      )..init(),
      builder: (context, _) {
        final TeamController controller = context.watch();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: controller.state.map(
            loading: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
            failed: (_) => RequestFailed(
              onRetry: () => controller.init(),
            ),
            loaded: (state) => TeamContent(state: state),
          ),
        );
      },
    );
  }
}
