import 'package:baseball_tapped_out/common/my_list_view.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/game_provider.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RotationTab extends ConsumerStatefulWidget {
  const RotationTab({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RotationTabState();
}

class _RotationTabState extends ConsumerState<RotationTab> {
  late List<Player> rotation = ref.watch(pitchersProvider);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: myReorderableListView(
            players: rotation,
            isHitter: false,
            onReorder: (oldIndex, newIndex) => setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final Player player = rotation.removeAt(oldIndex);
              rotation.insert(newIndex, player);

              ref.read(hittersProvider.notifier).updateState(rotation);
            }),
            ref: ref,
          ),
        ),
        Flexible(
            flex: 1,
            child: Text(ref.watch(pitcherClickedProvider)?.firstName ?? ''))
      ],
    );
  }
}
