import '../either/either.dart';
import '../enums.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/competition/competition.dart';

abstract class CompetitionRepository {
  Future<Either<HttpRequestFailure, List<Competition>>> getCompetitions(
      CompetitionClassification competitionClassification);
}
