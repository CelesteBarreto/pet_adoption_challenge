class PetModel {
  List<Dogs>? dogs;

  PetModel({this.dogs});

  PetModel.fromJson(Map<String, dynamic> json) {
    if (json['dogs'] != null) {
      dogs = <Dogs>[];
      json['dogs'].forEach((v) {
        dogs!.add(new Dogs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dogs != null) {
      data['dogs'] = this.dogs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Dogs {
  String? url;
  String? name;
  String? breed;
  String? sexo;
  String? age;
  String? geo;

  Dogs({this.url, this.name, this.breed, this.sexo, this.age, this.geo});

  Dogs.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    breed = json['breed'];
    sexo = json['sexo'];
    age = json['age'];
    geo = json['geo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['breed'] = this.breed;
    data['sexo'] = this.sexo;
    data['age'] = this.age;
    data['geo'] = this.geo;
    return data;
  }
}
