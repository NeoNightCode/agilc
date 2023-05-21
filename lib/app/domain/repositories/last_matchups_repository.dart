import '../either/either.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/matchup/matchup.dart';

abstract class LastMatchupsRepository {
  Future<Either<HttpRequestFailure, List<Matchup>>> getLastMatchups();
}
