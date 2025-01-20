import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/modules/episodes/episodes_body.dart';
import 'package:rick_and_morty_1/modules/error_body/error_body.dart';
import 'package:rick_and_morty_1/modules/home/presentation/home_screen.dart';
import 'package:rick_and_morty_1/modules/home/settings/settings_body.dart';
import 'package:rick_and_morty_1/modules/locations/locations_body.dart';
import 'package:rick_and_morty_1/modules/main/presentation/widgets/main_bottom_navigation.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _activeIndex = ValueNotifier<int>(0);
  @override
  void dispose() {
    _activeIndex.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: _activeIndex,
          builder: (context, child, value) => _buildBody(_activeIndex.value)),
      bottomNavigationBar: MainBottomNavigation(
        activeIndex: _activeIndex,
      ),
    );
  }
}

Widget _buildBody(int index) {
  switch (index) {
    case 0:
      return const HomeBody();
    case 1:
      return const LocationsBody();
    case 2:
      return const EpisodesBody();
    case 3:
      return const SettingsBody();
    default:
      return const ErrorBody();
  }
}
