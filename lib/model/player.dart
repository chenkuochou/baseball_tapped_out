import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:baseball_tapped_out/model/enum/fielding_position.dart';
import 'package:baseball_tapped_out/model/enum/personality.dart';
import 'package:baseball_tapped_out/model/enum/player_class_enum.dart';

@immutable
class Player {
  final int number;
  final String firstName;
  final String lastName;
  final String avatarUrl;
  final FieldingPosition position;
  final int stamina;
  final int? pitching;
  final int? batting;
  final int fielding;
  final int running;
  final int? control;
  final int? stability;
  final int? eye;
  final Personality? personality;
  final int potential;
  final bool? isPack;

  const Player({
    required this.number,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
    required this.position,
    required this.stamina,
    this.pitching = 0,
    this.batting = 0,
    required this.fielding,
    required this.running,
    this.control,
    this.stability,
    this.eye,
    this.personality,
    required this.potential,
    this.isPack = false,
  });

  double get ability => pitching != 0
      ? (stamina +
              pitching! * 2 +
              control! * 2 +
              stability! +
              fielding * 0.5 +
              running * 0.5 +
              potential) /
          8
      : (stamina + batting! * 2 + eye! * 2 + fielding + running + potential) /
          8;

  PlayerClass get playerClass => switch (ability) {
        < 60 => PlayerClass.dust,
        < 70 => PlayerClass.normal,
        < 80 => PlayerClass.rare,
        < 90 => PlayerClass.epic,
        _ => PlayerClass.legendary,
      };

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'number': number,
      'firstName': firstName,
      'lastName': lastName,
      'avatarUrl': avatarUrl,
      'position': position.name,
      'stamina': stamina,
      'pitching': pitching,
      'batting': batting,
      'fielding': fielding,
      'running': running,
      'control': control,
      'stability': stability,
      'eye': eye,
      'personality': personality?.name,
      'potential': potential,
      'isPack': isPack,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      number: map['number'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      avatarUrl: map['avatarUrl'] as String,
      position: FieldingPosition.values.byName(map['position']),
      stamina: map['stamina'] as int,
      pitching: map['pitching'] != null ? map['pitching'] as int : null,
      batting: map['batting'] != null ? map['batting'] as int : null,
      fielding: map['fielding'] as int,
      running: map['running'] as int,
      control: map['control'] != null ? map['control'] as int : null,
      stability: map['stability'] != null ? map['stability'] as int : null,
      eye: map['eye'] != null ? map['eye'] as int : null,
      personality: map['personality'] != null
          ? Personality.values.byName(map['personality'])
          : null,
      potential: map['potential'] as int,
      isPack: map['isPack'] != null ? map['isPack'] as bool : null,
    );
  }

  Player copyWith({
    int? number,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    FieldingPosition? position,
    int? stamina,
    int? pitching,
    int? batting,
    int? fielding,
    int? running,
    int? control,
    int? stability,
    int? eye,
    Personality? personality,
    int? potential,
    bool? isPack,
  }) {
    return Player(
      number: number ?? this.number,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      position: position ?? this.position,
      stamina: stamina ?? this.stamina,
      pitching: pitching ?? this.pitching,
      batting: batting ?? this.batting,
      fielding: fielding ?? this.fielding,
      running: running ?? this.running,
      control: control ?? this.control,
      stability: stability ?? this.stability,
      eye: eye ?? this.eye,
      personality: personality ?? this.personality,
      potential: potential ?? this.potential,
      isPack: isPack ?? this.isPack,
    );
  }

  @override
  String toString() {
    return 'Player(number: $number, firstName: $firstName, lastName: $lastName, avatarUrl:$avatarUrl, position: ${position.displayName}, stamina: $stamina, pitching: $pitching, batting: $batting, fielding: $fielding, running: $running, control: $control, stability: $stability, eye: $eye, personality: ${personality.toString()}, potential: $potential, isPack: $isPack)';
  }

  String toJson() => json.encode(toMap());
  factory Player.fromJson(String source) => Player.fromMap(json.decode(source) as Map<String, dynamic>);
}
