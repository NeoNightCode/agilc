import 'global_maps.dart';

enum FavoritesType {
  competition,
  team,
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
