import '../../domain/either/either.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/matchup/matchup.dart';
import '../../domain/repositories/last_matchups_repository.dart';
import '../services/remote/last_matchups_service.dart';

class LastMatchupsRepositoryImpl implements LastMatchupsRepository {
  LastMatchupsRepositoryImpl(this._lastMatchupsService);

  final LastMatchupsService _lastMatchupsService;

  @override
  Future<Either<HttpRequestFailure, List<Matchup>>> getLastMatchups() {
    return _lastMatchupsService.getLastMatchups();
  }
}
