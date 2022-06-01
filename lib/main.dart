import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/custom_widgets.dart';
import 'package:movies/movie_model.dart';
import 'package:movies/movies_provider.dart';
import 'package:movies/secret.dart';

void main() {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoviesListing(title: 'Flutter Demo Home Page'),
    );
  }
}

class MoviesListing extends StatefulWidget {
  const MoviesListing({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MoviesListing> createState() => _MoviesListingState();
}

class _MoviesListingState extends State<MoviesListing> {
  final List<MovieModel> movies = <MovieModel>[];

  @override
  void initState() {
    super.initState();

    _fetchMovies();
  }

  _fetchMovies() async {
    var data = await MoviesProvider.getJson();
    setState(() {
      data['results'].forEach((element) {
        movies.add(MovieModel.fromJson(element));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8),
            child: MovieTile(movie: movies[index],),
          ),
        ),
      ),
    );
  }
}
