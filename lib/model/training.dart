
import 'package:baseball_tapped_out/model/enum/training_type.dart';
import 'package:baseball_tapped_out/model/player.dart';

class Training {
  Training({
    required this.title,
    required this.duration,
    this.progress,
    required this.bgPath,
    this.player,
    required this.trainingType,
    required this.potentialUsed,
    required this.outputLevels,
    required this.levelExp,
    required this.levelGolds,
    required this.currentLevel,
    this.isActive = false,
  });

  final String title;
  final int duration;
  final double? progress;
  final String bgPath;
  final Player? player;
  final TrainingType trainingType;
  final int potentialUsed;
  final List<int> outputLevels;
  final List<int> levelExp;
  final List<int> levelGolds;
  final int currentLevel;
  final bool isActive;

  Player get outputPlayer => switch (trainingType) {
        TrainingType.pitching => player!
            .copyWith(pitching: player!.pitching! + outputLevels[currentLevel]),
        TrainingType.batting => player!
            .copyWith(batting: player!.batting! + outputLevels[currentLevel]),
        TrainingType.fielding => player!
            .copyWith(fielding: player!.fielding + outputLevels[currentLevel]),
        TrainingType.running => player!
            .copyWith(running: player!.running + outputLevels[currentLevel]),
        _ => player!
            .copyWith(stamina: player!.stamina + outputLevels[currentLevel]),
      };

  

  Training copyWith({
    String? title,
    int? duration,
    double? progress,
    String? bgPath,
    Player? player,
    TrainingType? trainingType,
    int? potentialUsed,
    List<int>? outputLevels,
    List<int>? levelExp,
    List<int>? levelGolds,
    int? currentLevel,
    bool? isActive,
  }) {
    return Training(
      title: title ?? this.title,
      duration: duration ?? this.duration,
      progress: progress ?? this.progress,
      bgPath: bgPath ?? this.bgPath,
      player: player ?? this.player,
      trainingType: trainingType ?? this.trainingType,
      potentialUsed: potentialUsed ?? this.potentialUsed,
      outputLevels: outputLevels ?? this.outputLevels,
      levelExp: levelExp ?? this.levelExp,
      levelGolds: levelGolds ?? this.levelGolds,
      currentLevel: currentLevel ?? this.currentLevel,
      isActive: isActive ?? this.isActive,
    );
  }
}
