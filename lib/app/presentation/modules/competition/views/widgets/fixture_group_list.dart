import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../../../../domain/models/competition/competition.dart';
import '../../../matchup/views/widgets/matchup_card.dart';

class FixturesGroupListView extends StatelessWidget {
  final List<Fixtures> fixtures;

  const FixturesGroupListView({super.key, required this.fixtures});

  @override
  Widget build(BuildContext context) {
    return GroupedListView<Fixtures, String>(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      elements: fixtures,
      groupBy: (fixture) => fixture.name,
      groupSeparatorBuilder: (String value) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      itemBuilder: (context, fixture) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: fixture.matchups
              .map((matchup) => MatchupCard(
                    matchup: matchup,
                    height: 100,
                  ))
              .toList(),
        );
      },
    );
  }
}
