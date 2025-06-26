class Task {
  int id;
  String name;
  bool checked;

  Task({required this.id, required this.name, required this.checked});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'checked': checked ? 1 : 0};
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(id: map['id'], name: map['name'], checked: map['checked'] == 1);
  }
}
