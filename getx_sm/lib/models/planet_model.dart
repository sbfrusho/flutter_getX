// lib/models/planet_model.dart
class PlanetModel {
  final String name;
  final String rotationPeriod;
  final String orbitalPeriod;
  final String diameter;
  final String climate;
  final String gravity;
  final String terrain;
  final String surfaceWater;
  final String population;
  final List<String> residents;
  final List<String> films;
  final String created;
  final String edited;
  final String url;

  PlanetModel({
    required this.name,
    required this.rotationPeriod,
    required this.orbitalPeriod,
    required this.diameter,
    required this.climate,
    required this.gravity,
    required this.terrain,
    required this.surfaceWater,
    required this.population,
    required this.residents,
    required this.films,
    required this.created,
    required this.edited,
    required this.url,
  });

  factory PlanetModel.fromJson(Map<String, dynamic> json) {
    return PlanetModel(
      name: json['name'] ?? 'Unknown',
      rotationPeriod: json['rotation_period'] ?? 'Unknown',
      orbitalPeriod: json['orbital_period'] ?? 'Unknown',
      diameter: json['diameter'] ?? 'Unknown',
      climate: json['climate'] ?? 'Unknown',
      gravity: json['gravity'] ?? 'Unknown',
      terrain: json['terrain'] ?? 'Unknown',
      surfaceWater: json['surface_water'] ?? 'Unknown',
      population: json['population'] ?? 'Unknown',
      residents: List<String>.from(json['residents'] ?? []),
      films: List<String>.from(json['films'] ?? []),
      created: json['created'] ?? '',
      edited: json['edited'] ?? '',
      url: json['url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'rotation_period': rotationPeriod,
      'orbital_period': orbitalPeriod,
      'diameter': diameter,
      'climate': climate,
      'gravity': gravity,
      'terrain': terrain,
      'surface_water': surfaceWater,
      'population': population,
      'residents': residents,
      'films': films,
      'created': created,
      'edited': edited,
      'url': url,
    };
  }
}