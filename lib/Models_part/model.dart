const String t_id = 'id';
const String t_title = 'title';
const String t_description = 'description';
const String t_dates = 'dates';

class noteModel {
  int id;
  String title;
  String description;
  String dates;

  noteModel({
    this.id=-1,
    required this.title,
    required this.description,
    required this.dates,
  });

  Map<String, Object?> to_map() {
    final map = <String, Object>{
      t_title: title,
      t_description: description,
      t_dates: dates,
    };
    if (id > 0) {
      map[t_id] = id;
      print("shohans= ${map[t_id]}");
    }
    return map;
  }

  factory noteModel.from_map(Map<String, dynamic> map) => noteModel(
    id: map[t_id] as int? ?? -1,
    title: map[t_title] as String,
    description: map[t_description] as String,
    dates: map[t_dates] as String,
  );
}