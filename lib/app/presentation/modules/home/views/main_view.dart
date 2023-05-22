import 'package:flutter/material.dart';

import '../../../routes/routes.dart';
import '../../competition/views/competition_view.dart';
import '../../settings/settings_view.dart';
import '../../team/views/team_view.dart';
import 'home_view.dart';
import 'widgets/bottom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  static final List<String> _tabs = [
    Routes.home,
    Routes.competitions,
    Routes.teams,
    Routes.settings,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: GlobalKey<NavigatorState>(),
        initialRoute: _tabs[_selectedIndex],
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case Routes.home:
              builder = (BuildContext _) => const HomeView();
              break;
            case Routes.competitions:
              builder = (BuildContext _) => const CompetitionView();
              break;
            case Routes.teams:
              builder = (BuildContext _) => const TeamView();
              break;
            case Routes.settings:
              builder = (BuildContext _) => const SettingsView();
              break;
            default:
              builder = (BuildContext _) => const HomeView();
              break;
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }
}
