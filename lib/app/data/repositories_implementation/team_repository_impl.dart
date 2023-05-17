import '../../domain/either/either.dart';
import '../../domain/enums.dart';
import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/team/team.dart';
import '../../domain/repositories/team_repository.dart';
import '../services/remote/team_service.dart';

class TeamRepositoryImpl implements TeamRepository {
  TeamRepositoryImpl(this._teamService);

  final TeamService _teamService;

  @override
  Future<Either<HttpRequestFailure, List<Team>>> getTeams(Islas islas) {
    return _teamService.getTeams(islas);
  }
}
