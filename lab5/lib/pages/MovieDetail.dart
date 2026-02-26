import 'package:flutter/material.dart';
import 'package:lab5/models/movie.dart';

class MovieDetail extends StatefulWidget {
  final Movie movie;
  const MovieDetail({super.key, required this.movie});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  // Hàm đổi trạng thái state
  void toggleFavorite() {
    setState(() {
      widget.movie.isFavorite = !widget.movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Căn lề trái cho cả cột
          children: [
            // 1. Dùng Stack
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(widget.movie.posterUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    widget.movie.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black45
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Căn trái nội dung bên trong
                children: [
                  Text(widget.movie.overview, textAlign: TextAlign.justify),
                  const SizedBox(height: 20),

                  // 2. Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Nút Ngôi sao
                      IconButton(
                        onPressed: toggleFavorite,
                        icon: const Icon(Icons.star),
                        color: widget.movie.isFavorite ? Colors.red : Colors.grey,
                      ),
                      // Nút Favorite
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite),
                        color: widget.movie.isFavorite ? Colors.red : Colors.grey,
                      ),
                      // Nút Share
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.share),
                        color: widget.movie.isFavorite ? Colors.red : Colors.grey,
                      ),
                    ],
                  ),

                  const Divider(),


                  const Text(
                      "Trailers",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(height: 10),

                  // 4. Hiển thị danh sách Trailer
                  for (var trailer in widget.movie.trailers)
                    ListTile(
                      leading: const Icon(Icons.play_circle_fill, color: Colors.red),
                      title: Text(trailer),
                      contentPadding: EdgeInsets.zero,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}