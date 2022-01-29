import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/src/home/models/movie.dart';
import 'package:moviesapp/src/movie/movie_page.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 1.5,
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //IMAGE
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MoviePage(movie: movie),
                  ),
                );
              },
              child: SizedBox(
                height: 200,
                width: 150,
                child: CachedNetworkImage(
                  imageUrl: movie.getImage(),
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Container(
                    child: const Icon(Icons.error),
                     decoration: BoxDecoration(
                      color: Colors.grey[350],
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ),

            //MOVIE NAME
            Container(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(
                getTitle(),
                maxLines: 1,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ),
          ],
        ));
  }

  String getTitle() {
    if (movie.title != null) {
      return movie.title!.length > 17
          ? movie.title!.substring(0, 13) + '...'
          : movie.title!;
    }
    return 'Name unavaliabe';
  }
}
