import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../domain/enums.dart';
import '../controller/competition_controller.dart';
import '../controller/state/competition_state.dart';
import 'widgets/competition_list.dart';

class CompetitionView extends StatefulWidget {
  const CompetitionView({super.key});

  @override
  State<CompetitionView> createState() => _CompetitionViewState();
}

class _CompetitionViewState extends State<CompetitionView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CompetitionController(
          const CompetitionState.loading(CompetitionClassification.all),
          competitionRepository: context.read())
        ..init(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: () => context.read<CompetitionController>().init(),
              child: const Column(
                children: [
                  SizedBox(height: 5),
                  Expanded(child: CompetitionList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
