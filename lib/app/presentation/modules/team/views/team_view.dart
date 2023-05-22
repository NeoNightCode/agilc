import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/enums.dart';
import '../controller/state/team_state.dart';
import '../controller/team_controller.dart';
import 'widgets/team_list.dart';

class TeamView extends StatefulWidget {
  const TeamView({super.key});

  @override
  State<TeamView> createState() => _TeamViewState();
}

class _TeamViewState extends State<TeamView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamController(
        TeamState.loading(Islas.all),
        teamRepository: context.read(),
      )..init(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: () => context.read<TeamController>().init(),
              child: const Column(
                children: [
                  SizedBox(height: 5),
                  Expanded(
                    child: TeamListView(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
