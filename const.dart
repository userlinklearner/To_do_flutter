class ToDo {
  String title;
  bool done;

  ToDo({
    required this.title,
    this.done = false,
  });

  // Factory constructor to create a ToDo object from JSON
  factory ToDo.factoryjson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      done: json['done'] ?? false,
    );
  }

  ToDo.fromjson(Map<String, dynamic> json) : title = json['title'], done = json['done'] ?? false; //special syntax for the constructor

  // Method to convert a ToDo object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
    };
  }
}