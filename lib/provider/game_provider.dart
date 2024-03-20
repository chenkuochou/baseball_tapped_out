import 'package:baseball_tapped_out/model/game_stats.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:baseball_tapped_out/provider/player_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hitterClickedProvider = StateProvider<Player?>((_) => null);
final pitcherClickedProvider = StateProvider<Player?>((_) => null);
final currentHitterProvider = StateProvider<Player>((ref) => ref.read(hittersProvider).first);
final currentPitcherProvider = StateProvider<Player?>((ref) => ref.read(pitchersProvider).first);

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
