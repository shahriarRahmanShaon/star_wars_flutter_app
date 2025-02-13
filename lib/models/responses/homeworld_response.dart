import 'dart:convert';

class Homeworld {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;

  Homeworld({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
  });

  factory Homeworld.fromJson(Map<String, dynamic> json) {
    return Homeworld(
      name: json["name"],
      rotationPeriod: json["rotation_period"],
      orbitalPeriod: json["orbital_period"],
      diameter: json["diameter"],
      climate: json["climate"],
      gravity: json["gravity"],
      terrain: json["terrain"],
      surfaceWater: json["surface_water"],
      population: json["population"],
    );
  }

  static Homeworld fromJsonString(String jsonString) {
    final Map<String, dynamic> data = jsonDecode(jsonString);
    return Homeworld.fromJson(data);
  }
}
