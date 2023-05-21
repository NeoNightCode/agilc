import '../../../domain/either/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/luchador/luchador.dart';
import '../../../domain/models/team/team.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class TeamService {
  final Http _http;

  TeamService(this._http);

  Future<Either<HttpRequestFailure, List<Team>>> getTeams(Islas islas) async {
    final result = await _http.request(
      '/equipos/${islas.value}',
      onSuccess: (json) {
        final list = List.from(json);
        return list
            .map(
              (e) => Team.fromJson(e),
            )
            .toList();
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }

  Future<Either<HttpRequestFailure, List<Luchador>>> getLuchadores() async {
    final result = await _http.request(
      '/luchadores',
      onSuccess: (json) {
        final list = List.from(json);
        return list
            .map(
              (e) => Luchador.fromJson(e),
            )
            .toList();
      },
    );

    return result.when(
      left: handleHttpFailure,
      right: (list) => Either.right(list),
    );
  }
}
