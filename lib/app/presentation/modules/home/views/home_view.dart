import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes/routes.dart';
import '../controller/home_controller.dart';
import '../controller/state/home_state.dart';
import 'widgets/last_matchups_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(
        HomeState(),
        lastMatchupsRepository: context.read(),
      )..init(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.profile,
                );
              },
              icon: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => RefreshIndicator(
              onRefresh: () => context.read<HomeController>().init(),
              child: const Column(
                children: [
                  SizedBox(height: 5),
                  Expanded(child: LastMatchupsList()),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
