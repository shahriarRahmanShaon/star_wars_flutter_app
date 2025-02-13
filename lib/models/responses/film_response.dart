import 'dart:convert';

class Film {
  final String title;
  final int episodeId;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;
  final List<String> characters;
  final List<String> planets;
  final List<String> starships;
  final List<String> vehicles;
  final List<String> species;

  Film({
    required this.title,
    required this.episodeId,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
    required this.characters,
    required this.planets,
    required this.starships,
    required this.vehicles,
    required this.species,
  });

  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
      title: json["title"],
      episodeId: json["episode_id"],
      openingCrawl: json["opening_crawl"],
      director: json["director"],
      producer: json["producer"],
      releaseDate: json["release_date"],
      characters: List<String>.from(json["characters"]),
      planets: List<String>.from(json["planets"]),
      starships: List<String>.from(json["starships"]),
      vehicles: List<String>.from(json["vehicles"]),
      species: List<String>.from(json["species"]),
    );
  }

  static List<Film> fromJsonList(String jsonString) {
    final List<dynamic> data = jsonDecode(jsonString);
    return data.map((e) => Film.fromJson(e)).toList();
  }
}
