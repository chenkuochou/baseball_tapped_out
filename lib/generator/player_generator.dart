import 'dart:math';

import 'package:baseball_tapped_out/model/model.dart';
import 'package:faker/faker.dart';

List<Player> generateHitters() {
  _fielderFielding.shuffle();

  return _generatePlayers(_fielderFielding);
}

List<Player> generatePitchers() {
  _pitcherFielding.shuffle();

  return _generatePlayers(_pitcherFielding);
}

List<Player> _generatePlayers(List positions) {
  List<Player> players = [];
  for (var i = 0; i < 9; i++) {
    players.add(_createAPlayer(false, playerClasses()[i], positions[i]));
  }
  return players;
}

Player _createAPlayer(
    bool isAHitter, PlayerClass playerClass, FieldingPosition position) {
  final firstName = faker.person.firstName();
  final lastName = faker.person.lastName();
  final number = _getRandomInt(0, 100);

  final List<int> values = _getListRandom(isAHitter ? 6 : 7, playerClass);

  return isAHitter
      ? Player(
          number: number,
          firstName: firstName,
          lastName: lastName,
          position: position,
          stamina: values[0],
          batting: values[1],
          eye: values[2],
          fielding: values[3],
          running: values[4],
          potential: values[5],
        )
      : Player(
          number: number,
          firstName: firstName,
          lastName: lastName,
          position: position,
          stamina: values[0],
          pitching: values[1],
          control: values[2],
          stability: values[3],
          fielding: values[4],
          running: values[5],
          potential: values[6],
        );
}

List<PlayerClass> playerClasses() => [
      PlayerClass.normal,
      PlayerClass.normal,
      PlayerClass.rare,
      PlayerClass.epic,
      PlayerClass.normal,
      PlayerClass.normal,
      PlayerClass.dust,
      PlayerClass.dust,
      PlayerClass.dust,
    ];

int _getRandomInt(int start, int endExclusive) {
  return Random().nextInt(endExclusive - start) + start;
}

List<int> _getListRandom(int items, PlayerClass playerClass) {
  List<int> getNumbers(int start, int endExclusive) {
    List<int> list = [];
    for (var i = 0; i < items; i++) {
      list.add(_getRandomInt(start, endExclusive));
    }
    return list;
  }

  return switch (playerClass) {
    PlayerClass.dust => getNumbers(30, 60),
    PlayerClass.normal => getNumbers(40, 70),
    PlayerClass.rare => getNumbers(50, 80),
    PlayerClass.epic => getNumbers(60, 90),
    _ => getNumbers(70, 100),
  };
}

List<FieldingPosition> _fielderFielding = [
  FieldingPosition.b1,
  FieldingPosition.b2,
  FieldingPosition.ss,
  FieldingPosition.b3,
  FieldingPosition.c,
  FieldingPosition.lf,
  FieldingPosition.cf,
  FieldingPosition.rf,
  FieldingPosition.dh,
];

List<FieldingPosition> _pitcherFielding = [
  FieldingPosition.sp,
  FieldingPosition.sp,
  FieldingPosition.sp,
  FieldingPosition.sp,
  FieldingPosition.rp,
  FieldingPosition.rp,
  FieldingPosition.rp,
  FieldingPosition.rp,
  FieldingPosition.cl,
];
