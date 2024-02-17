import 'package:baseball_tapped_out/model/game_stats.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pitcherClickedProvider = StateProvider<Player?>((_) {
  print('object');
  return null;
});

final hitterClickedProvider = StateProvider<Player?>((_) => null);

final gameStatsProvider =
    NotifierProvider<GameStatsNotifier, GameStats>(GameStatsNotifier.new);

class GameStatsNotifier extends Notifier<GameStats> {
  @override
  build() {
    return const GameStats(
      ball: 0,
      strike: 0,
      out: 0,
      inning: 1,
      isAway: true,
      baseList: [],
      scoreList: [
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0, 0, 0, 0],
      ],
      runs: [0, 0],
      hits: [0, 0],
      errors: [0, 0],
      isGameStart: false,
      instantMsg: '',
      pitcherIndex: [0, 0],
      pitcherList: [[], []],
      hitterIndex: [0, 0],
      hitterList: [[], []],
    );
  }
}
