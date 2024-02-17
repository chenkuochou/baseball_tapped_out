import 'package:baseball_tapped_out/common/my_list_view.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/game_provider.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LineupTab extends ConsumerStatefulWidget {
  const LineupTab({super.key});

  @override
  ConsumerState createState() => _LineupPageState();
}

class _LineupPageState extends ConsumerState<LineupTab> {
  late List<Player> lineup = ref.watch(hittersProvider);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: myReorderableListView(
            players: lineup,
            isHitter: true,
            onReorder: (oldIndex, newIndex) => setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Player player = lineup.removeAt(oldIndex);
              lineup.insert(newIndex, player);

              ref.read(hittersProvider.notifier).updateState(lineup);
            }),
            ref: ref,
          ),
        ),
        Flexible(
            flex: 1,
            child: Text(ref.watch(hitterClickedProvider)?.firstName ?? ''))
      ],
    );
  }
}
