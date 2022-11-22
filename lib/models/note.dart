class Note {
  int? id;
  String? title;
  String? description;

  String? date;

  Note(
      {this.id,
      required this.title,
      required this.description,
      required this.date});
  Note copyWith({
    int? id,
    String? date,
    String? title,
    String? description,
  }) {
    return Note(
      id: id ?? this.id,
      date: this.date,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"] as int,
        date: json["date"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() {
    return <String, Object?>{
      "title": title,
      "description": description,
      
      "date": date
    };
  }
}
