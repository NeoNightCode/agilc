import '../../domain/either/either.dart';
import '../../domain/enums.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/competition/competition.dart';
import '../../domain/repositories/competition_repository.dart';
import '../services/remote/competition_service.dart';

class CompetitionRepositoryImpl implements CompetitionRepository {
  CompetitionRepositoryImpl(this._competitionService);

  final CompetitionService _competitionService;

  @override
  Future<Either<HttpRequestFailure, List<Competition>>> getCompetitions(
      CompetitionClassification competitionClassification) {
    return _competitionService.getCompetitions(competitionClassification);
  }
}
