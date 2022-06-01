import 'package:flutter/material.dart';
import 'package:movies/movies_provider.dart';

class MovieTile extends StatelessWidget {
  final movie;

  const MovieTile({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          movie.poster_path == null ?
              Container() :
              Container(
                //Making image's width to half of the given screen size
                width: MediaQuery.of(context).size.width / 2,
                //Making image's height to one fourth of the given screen size
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: NetworkImage('${MoviesProvider.imagePathPrefix}/${movie.poster_path}'),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(1, 3),
                    ),
                  ]
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              movie.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(movie.overview),
          ),
          const Divider(color: Colors.grey,),
        ],
      ),
    );
  }
}