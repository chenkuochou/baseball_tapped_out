import 'package:baseball_tapped_out/common/common.dart';
import 'package:baseball_tapped_out/game/game_page.dart';
import 'package:baseball_tapped_out/team/team_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.black,
      body: SafeArea(
        child: Row(
          children: [
            NavigationRail(
              backgroundColor: Palette.black,
              selectedIndex: _selectedIndex,
              labelType: NavigationRailLabelType.selected,
              selectedLabelTextStyle: GoogleFonts.pressStart2p(fontSize: 8),
              groupAlignment: 0,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              destinations: <NavigationRailDestination>[
                NavigationRailDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: myText('Home'),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.people_outline),
                  selectedIcon: const Icon(Icons.people),
                  label: myText('Team'),
                ),
                NavigationRailDestination(
                  icon: const Badge(
                    // label: myText('4'),
                    child: Icon(Icons.games_outlined),
                  ),
                  selectedIcon: const Icon(Icons.games),
                  label: myText('Game'),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.fitness_center_outlined),
                  selectedIcon: const Icon(Icons.fitness_center),
                  label: myText('Training'),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.military_tech_outlined),
                  selectedIcon: const Icon(Icons.military_tech),
                  label: myText('Hero'),
                ),
                NavigationRailDestination(
                  icon: const Icon(Icons.settings_outlined),
                  selectedIcon: const Icon(Icons.settings),
                  label: myText('Setting'),
                ),
              ],
            ),
            // VerticalDivider(color: Palette.pureGrey, thickness: 2),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: [
                  myText('selectedIndex: $_selectedIndex'),
                  const TeamPage(),
                  const GamePage(),
                  const Center(
                    child: Text('Coming soon!'),
                  ),
                  myText('selectedIndex: $_selectedIndex'),
                  myText('selectedIndex: $_selectedIndex'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
