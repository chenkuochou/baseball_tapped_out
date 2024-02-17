import 'package:baseball_tapped_out/common/common.dart';
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
          leading: Text(
            (index + 1).toString(),
            // style: TextStyle(color: Palette.pureWhite),
          ),
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '#${player.number.toString()}',
            // style: const TextStyle(color: Colors.white),
          ),
          // SizedBox(width: size.width * 0.02),
          Text(
            player.firstName,
            // style: const TextStyle(color: Colors.white),
          ),
          // SizedBox(width: size.width * 0.02),
          myText(player.lastName),
          myText(player.position.displayName)
        ]),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: size.width * 0.28,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              player.lastName,
              // style: MyFontStyle.bigAndBold(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
