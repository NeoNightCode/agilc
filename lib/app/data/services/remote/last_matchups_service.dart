import '../../../domain/either/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/matchup/matchup.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class LastMatchupsService {
  final Http _http;

  LastMatchupsService(this._http);

  Future<Either<HttpRequestFailure, List<Matchup>>> getLastMatchups() async {
    final result = await _http.request(
      '/ultimos_enfrentamientos',
      onSuccess: (json) {
        final list = List.from(json);
        return list
            .map(
              (e) => Matchup.fromJson(e),
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
