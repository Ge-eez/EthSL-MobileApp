class ChallengeModel {
  late String id;
  late String name;
  late String discription;
  late String level;
  late List requirments;
  late List symbols;
  late bool isActive = false;

  ChallengeModel({
    required this.id,
    required this.name,
    required this.discription,
    required this.level,
    required this.requirments,
    required this.symbols,
  });

  ChallengeModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '-';
    name = json['name'] ?? '';
    discription = json['description'] ?? '';
    level = json['level'] ?? '';
    requirments = json['requirements'] ?? '';
    symbols = json['symbols'] ?? '';
  }
}
