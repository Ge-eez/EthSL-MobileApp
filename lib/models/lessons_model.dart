class LessonModel {
  late String id;
  late String name;
  late String discription;
  late String level;
  late List symbols;

  LessonModel(
      {required this.id,
      required this.name,
      required this.discription,
      required this.level,
      required this.symbols,});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '-';
    name = json['name'] ?? '';
    discription = json['description'] ?? '';
    level = json['level'] ?? '';
    symbols = json['symbols'] ?? '';
  }
}
