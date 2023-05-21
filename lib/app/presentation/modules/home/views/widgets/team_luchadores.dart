import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/either/either.dart';
import '../../../../../domain/failures/http_request/http_request_failure.dart';
import '../../../../../domain/models/luchador/luchador.dart';
import '../../../../../domain/repositories/team_repository.dart';

typedef EitherListLuchador = Either<HttpRequestFailure, List<Luchador>>;

class TeamLuchadores extends StatefulWidget {
  const TeamLuchadores({super.key});

  @override
  State<TeamLuchadores> createState() => _TeamLuchadoresState();
}

class _TeamLuchadoresState extends State<TeamLuchadores> {
  late Future<EitherListLuchador> _future;

  @override
  void initState() {
    super.initState();
    _future = context.read<TeamRepository>().getLuchadores();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<EitherListLuchador>(
        future: _future,
        builder: (_, snapshopt) {
          if (!snapshopt.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return snapshopt.data!.when(
            left: (_) => const Text('Error'),
            right: (list) => ListView.builder(
              itemBuilder: (_, index) {
                final luchador = list[index];
                return SizedBox(
                  width: 300,
                  height: 300,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: ExtendedImage.network(
                          luchador.imagePath,
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: list.length,
            ),
          );
        },
      ),
    );
  }
}
