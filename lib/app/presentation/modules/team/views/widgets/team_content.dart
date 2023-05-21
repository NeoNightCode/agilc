import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../controller/state/team_state.dart';

class TeamContent extends StatelessWidget {
  const TeamContent({Key? key, required this.state}) : super(key: key);

  final TeamListStateLoaded state;

  @override
  Widget build(BuildContext context) {
    final team = state.team;
    return SingleChildScrollView(
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
                        fontSize: 24,
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
          Container(
            height: 10.0, // Altura del Divider
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.5),
                  Colors.black,
                ],
              ),
            ),
          ),
          GroupedListView<dynamic, String>(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            elements: team.fighters,
            groupBy: (element) => 'Listado Luchadores',
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Text(value),
            itemBuilder: (context, element) {
              return ListTile(
                title: Text(element.name),
                // Aquí puedes agregar más detalles sobre cada luchador
              );
            },
          ),
          GroupedListView<dynamic, String>(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            elements: team
                .personnel, // Asegúrate de que este campo existe en tu objeto `team`
            groupBy: (element) => 'Directivos',
            useStickyGroupSeparators: true,
            groupSeparatorBuilder: (String value) => Text(value),
            itemBuilder: (context, element) {
              return ListTile(
                title: Text(element.name),
                // Aquí puedes agregar más detalles sobre cada directivo
              );
            },
          ),
        ],
      ),
    );
  }
}
