//making the Source model --> parsing the json

class Source {
  late String id;
  late String name;

  //creating the constructor
  Source({required this.id, required this.name});

//creating the factory function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
