import 'package:flutter/material.dart';
import 'package:lab5/models/movie.dart';
import 'MovieDetail.dart';

class HomePage extends StatelessWidget {
  final List<Movie> movies = [
    Movie(
      title: "Dune: Part Two",
      rating: "8.6",
      genres: "Sci-Fi, Adventure, Drama",
      overview: "Paul Atreides unites with Chani and the Fremen while seeking revenge.",
      posterUrl: "https://picsum.photos/seed/dune/400/300",
      trailers: ["Official Trailer #1", "IMAX Sneak Peek"],
    ),
    Movie(
      title: "Deadpool & Wolverine",
      rating: "8.3",
      genres: "Action, Comedy",
      overview: "The multiverse gets messy when Wade Wilson teams up with Wolverine.",
      posterUrl: "https://picsum.photos/seed/marvel/400/300",
      trailers: ["Red Band Trailer", "Behind the Scenes"],
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Movie"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [

          for (int i = 0; i < movies.length; i++)
            MovieCard(movie: movies[i]),
        ],
      ),
    );
  }
}

class MovieCard extends StatefulWidget {
  final Movie movie;
  const MovieCard({super.key, required this.movie});

  @override
  State<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  void changeState() {
    setState(() {
      widget.movie.isFavorite = !widget.movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(widget.movie.posterUrl, width: 80, fit: BoxFit.cover),
        title: Text(widget.movie.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.movie.genres),
            IconButton(
              onPressed: changeState,
              icon: const Icon(Icons.star),
              color: widget.movie.isFavorite ? Colors.red : Colors.grey,
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Navigator
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovieDetail(movie: widget.movie)),
          );
        },
      ),
    );
  }
}