import 'global_maps.dart';

enum CompetitionClassification {
  all,
  primera,
  segunda,
  tercera,
}

extension CompetitionClassificationExtension on CompetitionClassification {
  String get value {
    switch (this) {
      case CompetitionClassification.all:
        return competitionCategoryMap['Todas las Clasificaciones']!;
      case CompetitionClassification.primera:
        return competitionCategoryMap['Primera']!;
      case CompetitionClassification.segunda:
        return competitionCategoryMap['Segunda']!;
      case CompetitionClassification.tercera:
        return competitionCategoryMap['Tercera']!;
    }
  }
}

enum Preference {
  darkMode,
}

enum Themes {
  clear,
  dark,
  midnight,
}

enum Islas {
  all,
  lanzarote,
  fuerteventura,
  tenerife,
  granCanaria,
  elHierro,
  laGomera,
  laPalma,
}

extension IslasExtension on Islas {
  String get value {
    switch (this) {
      case Islas.all:
        return islasMap['Todas las Islas']!;
      case Islas.lanzarote:
        return islasMap['Lanzarote']!;
      case Islas.fuerteventura:
        return islasMap['Fuerteventura']!;
      case Islas.tenerife:
        return islasMap['Lanzarote']!;
      case Islas.granCanaria:
        return islasMap['Lanzarote']!;
      case Islas.elHierro:
        return islasMap['Lanzarote']!;
      case Islas.laGomera:
        return islasMap['Lanzarote']!;
      case Islas.laPalma:
        return islasMap['Lanzarote']!;
    }
  }
}
