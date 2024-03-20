import 'package:baseball_tapped_out/common/common.dart';
import 'package:baseball_tapped_out/team/tab/fielding_tab.dart';
import 'package:baseball_tapped_out/team/tab/lineup_tab.dart';
import 'package:baseball_tapped_out/team/tab/rotation_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                labelStyle: GoogleFonts.pressStart2p(fontSize: 10),
                labelColor: Palette.pureWhite,
                unselectedLabelColor: Palette.pureGrey,
                indicatorColor: Palette.pureWhite,
                dividerHeight: 0,
                tabs: const [
                  Tab(text: 'Lineup'),
                  Tab(text: 'Fielding'),
                  Tab(text: 'Rotation'),
                ],
              ),
            ],
          ),
          // bottom: const TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.directions_car)),
          //     Tab(icon: Icon(Icons.directions_transit)),
          //     Tab(icon: Icon(Icons.directions_bike)),
          //   ],
          // ),
        ),
        body: const TabBarView(
          children: [
            LineupTab(
              key: PageStorageKey('lineup'),
            ),
            FieldingTab(
              key: PageStorageKey('fielding'),
            ),
            RotationTab(
              key: PageStorageKey('rotation'),
            ),
          ],
        ),
      ),
    );
  }
}
