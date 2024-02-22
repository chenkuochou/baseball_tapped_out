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
    return LayoutBuilder(
      builder: (_, constraints) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Text(ref.watch(pitcherClickedProvider)?.firstName ?? '')),
          SizedBox(
            width: constraints.maxWidth * 0.5,
            child: myReorderableListView(
              players: rotation,
              isHitter: false,
              onReorder: (oldIndex, newIndex) => setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final Player player = rotation.removeAt(oldIndex);
                rotation.insert(newIndex, player);

                ref.read(pitchersProvider.notifier).updateState(rotation);
              }),
              ref: ref,
            ),
          ),
        ],
      ),
    );
  }
}
