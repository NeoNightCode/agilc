import '../../../domain/either/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/competition/competition.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class CompetitionService {
  final Http _http;

  CompetitionService(this._http);

  Future<Either<HttpRequestFailure, List<Competition>>> getCompetitions(
      CompetitionClassification competitionClassification) async {
    final result = await _http.request(
      '/competiciones/${competitionClassification.value}',
      onSuccess: (json) {
        final list = List.from(json);
        return list
            .map(
              (e) => Competition.fromJson(e),
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
