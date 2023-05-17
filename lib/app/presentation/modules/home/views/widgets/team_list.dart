import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/either/either.dart';
import '../../../../../domain/enums.dart';
import '../../../../../domain/failures/http_request/http_request_failure.dart';
import '../../../../../domain/models/team/team.dart';
import '../../../../../domain/repositories/team_repository.dart';
import 'team_islas.dart';
import 'team_tile.dart';

typedef EitherListTeam = Either<HttpRequestFailure, List<Team>>;

class TeamList extends StatefulWidget {
  const TeamList({super.key});

  @override
  State<TeamList> createState() => _TeamListState();
}

class _TeamListState extends State<TeamList> {
  TeamRepository get _teamRepository => context.read();
  late Future<EitherListTeam> _future;
  final Islas _islas = Islas.all;
  @override
  void initState() {
    super.initState();
    _future = _teamRepository.getTeams(_islas);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeamIslas(
          islas: _islas,
          onChanged: (islas) {
            setState(() {
              islas = islas;
              _future = _teamRepository.getTeams(islas);
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        AspectRatio(
            aspectRatio: 16 / 14,
            child: LayoutBuilder(
              builder: (_, contraints) {
                final height = contraints.maxHeight * 0.3;
                return Center(
                  child: FutureBuilder<EitherListTeam>(
                    key: ValueKey(_future),
                    future: _future,
                    builder: (_, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      }
                      return snapshot.data!.when(
                        left: (failure) => Text(
                          failure.toString(),
                        ),
                        right: (list) {
                          return ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            itemBuilder: (_, index) {
                              final team = list[index];
                              return TeamTile(
                                team: team,
                                height: height,
                              );
                            },
                            itemCount: list.length,
                            separatorBuilder: (
                              _,
                              int index,
                            ) =>
                                const SizedBox(
                              height: 10,
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            )),
      ],
    );
  }
}
