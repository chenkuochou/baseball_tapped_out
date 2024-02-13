import 'package:baseball_tapped_out/model/player.dart';
import 'package:flutter/foundation.dart';

@immutable
class GameStats {
  final int ball;
  final int strike;
  final int out;
  final int inning;
  final bool isAway;
  final List<String?> baseList;
  final List<List<int>> scoreList;
  final List runs;
  final List hits;
  final List errors;

  final bool isGameStart;
  final String instantMsg;

  final List<int> pitcherIndex;
  final List<List<Player>> pitcherList;
  final List<int> hitterIndex;
  final List<List<Player>> hitterList;

  const GameStats({
    required this.ball,
    required this.strike,
    required this.out,
    required this.inning,
    required this.isAway,
    required this.baseList,
    required this.scoreList,
    required this.runs,
    required this.hits,
    required this.errors,
    required this.isGameStart,
    required this.pitcherIndex,
    required this.pitcherList,
    required this.hitterIndex,
    required this.hitterList,
    required this.instantMsg,
  });
}
