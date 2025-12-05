class Jogo {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  List<Screenshots>? screenshots;

  Jogo(
      {this.id,
      this.title,
      this.thumbnail,
      this.status,
      this.shortDescription,
      this.description,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl,
      this.screenshots});

  Jogo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    shortDescription = json['short_description'];
    description = json['description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
    if (json['screenshots'] != null) {
      screenshots = <Screenshots>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(new Screenshots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['thumbnail'] = this.thumbnail;
    data['status'] = this.status;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['game_url'] = this.gameUrl;
    data['genre'] = this.genre;
    data['platform'] = this.platform;
    data['publisher'] = this.publisher;
    data['developer'] = this.developer;
    data['release_date'] = this.releaseDate;
    data['freetogame_profile_url'] = this.freetogameProfileUrl;
    if (this.screenshots != null) {
      data['screenshots'] = this.screenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Screenshots {
  int? id;
  String? image;

  Screenshots({this.id, this.image});

  Screenshots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
