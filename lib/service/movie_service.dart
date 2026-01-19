import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Movie {
  final String title;
  final int year;
  final String poster;
  final String description;
  final String trailerUrl;

  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.description,
    required this.trailerUrl,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      year: json['year'],
      poster: json['poster'],
      description: json['description'],
      trailerUrl: json['trailer'] ?? '',
    );
  }
}

class MovieService {
  Future<List<Movie>> loadLocalMovies() async {
    final data = await rootBundle.loadString('assets/data/movies.json');
    final List<dynamic> jsonList = json.decode(data);
    return jsonList.map((json) => Movie.fromJson(json)).toList();
  }
}
