class People {
  String? name;
  String? photo;
  int? age;
  String? description;
  String? date;
  String? time;

  People(
      {this.name,
      this.photo,
      this.age,
      this.description,
      this.date,
      this.time});

  People.fromJson(Map<String, dynamic> json) {
    name = json['name']as String;
    photo = json['photo'];
    age = json['age']as int;
    description = json['description']as String;
    date = json['date'] as String;
    time = json['time'];
  }


}