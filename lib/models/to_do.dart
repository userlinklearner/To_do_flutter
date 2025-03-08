class ToDo {
  String title;
  bool done;

  ToDo({              //predefine the variables and how they are going to work
    required this.title,
    this.done = false,
  });
  factory ToDo.fromJson(Map<String,dynamic>json){
    return ToDo(title: json['title'],done: json['done']??false);

  }
  Map<String,dynamic> toJson(){
    return {
      'title':title,
      'done':done,
    };
  }
}
