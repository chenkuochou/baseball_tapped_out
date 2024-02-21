import 'package:baseball_tapped_out/common/common.dart';
import 'package:baseball_tapped_out/model/enum/player_class_enum.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

ReorderableListView myReorderableListView(
        {required List<Player> players,
        required bool isHitter,
        required Function onReorder,
        required WidgetRef ref}) =>
    ReorderableListView.builder(
      itemCount: players.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: Key('$index'),
          onTap: isHitter
              ? () => ref.read(hitterClickedProvider.notifier).state =
                  players[index]
              : () => ref.read(pitcherClickedProvider.notifier).state =
                  players[index],
          dense: true,
          minLeadingWidth: 0,
          // horizontalTitleGap: 0,
          leading: myText((index + 1).toString(), Palette.white, 15),
          title: PlayerTile(player: players[index], isHitter: isHitter),
          trailing: ReorderableDragStartListener(
            index: index,
            child: const Icon(Icons.drag_handle),
          ),
        );
      },
      onReorder: (int oldIndex, int newIndex) => onReorder(oldIndex, newIndex),
      buildDefaultDragHandles: false,
    );

class PlayerTile extends StatelessWidget {
  const PlayerTile({super.key, required this.player, required this.isHitter});
  final Player player;
  final bool isHitter;

  final double iconSize = 15;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '#${player.number.toString()}',
                    ),
                    const SizedBox(width: 10),
                    LayoutBuilder(
                      builder: (_, constraints) => ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: constraints.maxWidth,
                        ),
                        child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: myText(
                                '${player.firstName} ${player.lastName}')),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    myText(player.position.displayName),
                    const SizedBox(width: 15),
                    isHitter
                        ? Row(
                            children: [
                              Icon(Icons.bolt, size: iconSize),
                              const SizedBox(width: 5),
                              myText(player.batting.toString(),
                                  getClassColorByPlayer(player.playerClass)),
                              const SizedBox(width: 10),
                              Icon(Icons.remove_red_eye, size: iconSize),
                              const SizedBox(width: 5),
                              myText(player.eye.toString(),
                                  getClassColorByPlayer(player.playerClass)),
                            ],
                          )
                        : Row(
                            children: [
                              Icon(Icons.sports_baseball, size: iconSize),
                              const SizedBox(width: 5),
                              myText(player.pitching.toString(),
                                  getClassColorByPlayer(player.playerClass)),
                              const SizedBox(width: 10),
                              Icon(Icons.mode_standby, size: iconSize),
                              const SizedBox(width: 5),
                              myText(player.control.toString(),
                                  getClassColorByPlayer(player.playerClass)),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
        myText(player.ability.round().toString(),
            getClassColorByPlayer(player.playerClass), 15, FontWeight.bold)
      ],
    );
  }
}
