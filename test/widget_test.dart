import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tp3_brooks_william/pages/movie_list_page.dart';
import 'package:tp3_brooks_william/service/movie_service.dart';

class FakeMovieService extends MovieService {
  @override
  Future<List<Movie>> loadLocalMovies() async => [];
}

void main() {
  testWidgets('Movie list page shows title', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: MovieListPage(movieService: FakeMovieService()),
      ),
    );

    // Allow async initState to run
    await tester.pump();

    expect(find.text('🎬 Liste de films'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}