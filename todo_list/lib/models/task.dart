class Task {
  String title;
  DateTime date;
  bool isCompleted = false;

  Task({required this.title, required this.date});

  Task.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        date = DateTime.parse(json['date']),
        isCompleted = json['isCompleted'] == 'true' ? true : false;

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'isCompleted': isCompleted.toString(),
    };
  }
}
