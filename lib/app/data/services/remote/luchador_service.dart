import '../../../domain/either/either.dart';
import '../../../domain/enums.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../../domain/models/luchador/luchador.dart';
import '../../http/http.dart';
import '../utils/handle_failure.dart';

class LuchadorService {
  final Http _http;

  LuchadorService(this._http);

  Future<Either<HttpRequestFailure, List<Luchador>>> getTeams(
      Islas islas) async {
    final result = await _http.request(
      '/luchadores/${islas.name}',
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
