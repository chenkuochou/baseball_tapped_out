import 'dart:math';

import 'package:baseball_tapped_out/model/enum/fielding_position.dart';
import 'package:baseball_tapped_out/model/enum/player_class_enum.dart';
import 'package:baseball_tapped_out/model/player.dart';
import 'package:faker/faker.dart';

List<Player> generateHitters() {
  _fielderFielding.shuffle();

  return _createPlayers(
      true,
      9,
      [
        PlayerClass.rare,
        PlayerClass.normal,
        PlayerClass.rare,
        PlayerClass.epic,
        PlayerClass.normal,
        PlayerClass.normal,
        PlayerClass.normal,
        PlayerClass.dust,
        PlayerClass.dust,
      ],
      _fielderFielding);
}

List<Player> generatePitchers() {
  return _createPlayers(
      false,
      9,
      [
        PlayerClass.epic,
        PlayerClass.rare,
        PlayerClass.normal,
        PlayerClass.normal,
        PlayerClass.normal,
        PlayerClass.normal,
        PlayerClass.dust,
        PlayerClass.dust,
        PlayerClass.rare,
      ],
      _pitcherFielding);
}

List<Player> _createPlayers(bool isAHitter, int numberOfPlayers,
    List<PlayerClass> playerClasses, List positions) {
  final List<int> numbers = _getRandomList(numberOfPlayers);

  Player createAPlayer(int index) {
    final firstName = faker.person.firstName();
    final lastName = faker.person.lastName();
    final avatarUrl =
        'https://api.dicebear.com/7.x/pixel-art/png?seed=$lastName${DateTime.now()}';

    final List<int> values =
        _getListRandom(isAHitter ? 6 : 7, playerClasses[index]);

    return isAHitter
        ? Player(
            number: numbers[index],
            firstName: firstName,
            lastName: lastName,
            avatarUrl: avatarUrl,
            position: positions[index],
            stamina: values[0],
            batting: values[1],
            eye: values[2],
            fielding: values[3],
            running: values[4],
            potential: values[5],
          )
        : Player(
            number: numbers[index],
            firstName: firstName,
            lastName: lastName,
            avatarUrl: avatarUrl,
            position: positions[index],
            stamina: values[0],
            pitching: values[1],
            control: values[2],
            stability: values[3],
            fielding: values[4],
            running: values[5],
            potential: values[6],
          );
  }

  List<Player> players = [];
  for (var i = 0; i < 9; i++) {
    players.add(createAPlayer(i));
  }
  return players;
}

List<int> _getRandomList(int items) {
  final List<int> numbers = [];
  for (var i = 0; i < items; i++) {
    int number = _getRandomInt(0, 100);
    while (numbers.contains(number)) {
      number = _getRandomInt(0, 100);
    }
    numbers.add(number);
  }
  return numbers;
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

int _getRandomInt(int start, int endExclusive) {
  return Random().nextInt(endExclusive - start) + start;
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
