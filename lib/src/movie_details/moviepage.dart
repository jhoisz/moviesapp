import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/src/home/models/movie.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;

  const MoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      image: DecorationImage(
                          image: NetworkImage(widget.movie.image.toString()),
                          fit: BoxFit.cover)),
                ),
                Center(
                    child: Container(
                        padding: const EdgeInsets.all(25.0),
                        height: MediaQuery.of(context).size.height / 4.8,
                        width: MediaQuery.of(context).size.width / 1.1,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 6,
                                  offset: const Offset(0, 8))
                            ]),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text(widget.movie.name.toString().toUpperCase(),
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24))),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Type',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text(
                                    'anime,  adventure,  fantasy, infantile',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(fontSize: 14))),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('Released in',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14))),
                            Container(
                                alignment: Alignment.topLeft,
                                child: Text('30/07/2010',
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(fontSize: 14))),
                          ],
                        ))),
                Container(
                  padding: const EdgeInsets.all(30.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 30,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.pop(context);
                    }
                  )
                )
              ],
            )));
  }
}
