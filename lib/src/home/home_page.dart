import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/src/home/models/movie.dart';
import 'package:moviesapp/src/home/services/home_service.dart';
import 'widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> listMovies = [];
  final homeService = HomeService();

  @override
  void initState() {
    homeService.fetchMovies().then((value) {
      setState(() {
        listMovies = value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          //SEARCH BAR
          Container(
              margin: const EdgeInsets.fromLTRB(0, 50.0, 0, 20.0),
              width: MediaQuery.of(context).size.width / 1.2,
              height: 45.0,
              decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 8,
                        offset: const Offset(0, 6))
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    onChanged: (text) {
                      print('Campo de texto: $text');
                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText: 'Search',
                        labelStyle:
                            TextStyle(color: Color(0xFF7E7E7E), fontSize: 14),
                        // border: disabledBorder,
                        suffixIcon: Icon(Icons.search))),
              )),

          //MOVIES TEXT
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
              child: Text('Movies',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 32))),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: ((MediaQuery.of(context).size.width / 1.8) /
                  (MediaQuery.of(context).size.height /2.9)),
              children: List.generate(
                listMovies.length,
                (index) {
                  return MovieCard(movie: listMovies[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
