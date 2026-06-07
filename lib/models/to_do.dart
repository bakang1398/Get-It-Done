class ToDo {
  String? id;
  String? title;
  bool? isDone;
  String? createdAt;
  String? updatedAt;

  ToDo({
    this.id,
    this.title,
    this.isDone,
    this.createdAt,
    this.updatedAt,
  });

  ToDo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    isDone = json['isDone'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['isDone'] = isDone;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }

}