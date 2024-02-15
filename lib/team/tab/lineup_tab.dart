import 'package:baseball_tapped_out/common/palette.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/lineup_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LineupTab extends ConsumerStatefulWidget {
  const LineupTab({super.key});

  @override
  ConsumerState createState() => _LineupPageState();
}

class _LineupPageState extends ConsumerState<LineupTab> {
  late List<Player> lineup = ref.watch(lineupProvider);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: ReorderableListView.builder(
            itemCount: lineup.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                key: Key('$index'),
                leading: Text(
                  (index + 1).toString(),
                  // style: TextStyle(color: Palette.pureWhite),
                ),
                title: PlayerTile(player: lineup[index]),
                trailing: ReorderableDragStartListener(
                  index: index,
                  child: const Icon(Icons.drag_handle),
                ),
              );
            },
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Player player = lineup.removeAt(oldIndex);
                lineup.insert(newIndex, player);

                ref.read(lineupProvider.notifier).changeState(lineup);
              });
            },
            buildDefaultDragHandles: false,
          ),
        ),
        const Flexible(flex: 1, child: Text('data'))
      ],
    );
  }
}

class PlayerTile extends StatelessWidget {
  const PlayerTile({super.key, required this.player});
  final Player player;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(children: [
          Text(
            '#${player.number.toString()}',
            // style: const TextStyle(color: Colors.white),
          ),
          SizedBox(width: size.width * 0.02),
          Text(
            player.firstName,
            // style: const TextStyle(color: Colors.white),
          ),
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
