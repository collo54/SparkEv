class RoutesModifiersModel {
  RoutesModifiersModel({
    required this.avoidTolls,
    required this.avoidHighways,
    required this.avoidFerries,
  });

  final bool avoidTolls;
  final bool avoidHighways;
  final bool avoidFerries;

  Map<String, dynamic> toMap() {
    return {
      'avoidTolls': avoidTolls,
      'avoidHighways': avoidHighways,
      'avoidFerries': avoidFerries,
    };
  }
}
