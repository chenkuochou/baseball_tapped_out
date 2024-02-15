import 'package:baseball_tapped_out/game/section/control_section.dart';
import 'package:baseball_tapped_out/game/section/field_section.dart';
import 'package:baseball_tapped_out/game/section/lineup_section.dart';
import 'package:baseball_tapped_out/game/section/stats_section.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          color: Colors.green.shade900,
          height: size.height * 0.17,
          child: const StatsSection(),
        ),
        Expanded(
          child: Container(
            color: Colors.green.shade800,
            child: Row(
              children: [
                const Flexible(
                  flex: 2,
                  child: Lineup(),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.green.shade900,
                    child: const FieldSection(),
                  ),
                ),
                const Flexible(
                  flex: 3,
                  child: ControlSection(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
