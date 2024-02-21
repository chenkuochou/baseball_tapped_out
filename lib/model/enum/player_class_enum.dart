import 'package:flutter/material.dart';

enum PlayerClass {
  dust,
  normal,
  rare,
  epic,
  legendary,
  pack;

  String get displayName => switch (this) {
        PlayerClass.dust => 'Dust',
        PlayerClass.normal => 'Normal',
        PlayerClass.rare => 'Rare',
        PlayerClass.epic => 'Epic',
        PlayerClass.legendary => 'Legendary',
        PlayerClass.pack => 'Pack',
      };
}

Color getClassColorByPlayer(PlayerClass player) => switch (player) {
      PlayerClass.dust => Colors.grey,
      PlayerClass.normal => Colors.blue,
      PlayerClass.rare => Colors.purple,
      PlayerClass.epic => Colors.red,
      PlayerClass.legendary => const Color(0xFFFEBE4C),
      PlayerClass.pack => Colors.green,
    };
