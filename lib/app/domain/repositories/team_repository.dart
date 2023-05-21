import '../either/either.dart';
import '../enums.dart';
import '../failures/http_request/http_request_failure.dart';
import '../models/luchador/luchador.dart';
import '../models/team/team.dart';

abstract class TeamRepository {
  Future<Either<HttpRequestFailure, List<Team>>> getTeams(Islas islas);

  Future<Either<HttpRequestFailure, List<Luchador>>> getLuchadores();
}
