import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/src/home/models/movie.dart';
import 'widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> listMovies = [];

  var movies = [
    {
      'name: ': 'AAAAAA',
      'image':
          'https://lojasaraiva.vteximg.com.br/arquivos/ids/12105538/1002443202.jpg?v=637142234580400000'
    },
    {
      'name': 'Ponyo (2010)',
      'image':
          'https://upload.wikimedia.org/wikipedia/pt/e/e2/Ponyo_p%C3%B4ster.png'
    },
    {
      'name': 'Mr. Nobody (2009)',
      'image': 'https://m.media-amazon.com/images/I/91WY2zIvzzL._AC_SY550_.jpg'
    },
    {
      'name': 'O Hobbit: A desolação de Smaug (2013)',
      'image':
          'https://br.web.img3.acsta.net/pictures/210/571/21057125_20131112201221324.jpg'
    },
    {
      'name': 'Mr. Nobody (2009)',
      'image': 'https://m.media-amazon.com/images/I/91WY2zIvzzL._AC_SY550_.jpg'
    },
    {
      'name': 'O Hobbit: A desolação de Smaug (2013) ',
      'image':
          'https://br.web.img3.acsta.net/pictures/210/571/21057125_20131112201221324.jpg'
    },
    {
      'name': 'Mr. Nobody (2009)',
      'image': 'https://m.media-amazon.com/images/I/91WY2zIvzzL._AC_SY550_.jpg'
    },
    {
      'name': 'O Hobbit: A desolação de Smaug (2013)',
      'image':
          'https://br.web.img3.acsta.net/pictures/210/571/21057125_20131112201221324.jpg'
    }
  ];

  @override
  void initState() {
    for (var element in movies) {
      listMovies.add(Movie.fromJson(element));
    }
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
            childAspectRatio: ((MediaQuery.of(context).size.width/1.8)/(MediaQuery.of(context).size.height/2.8)),
            children: List.generate(listMovies.length, (index){
                return  MovieCard(movie: listMovies[index]);
                
              }
            ),
          )
          ),
          
        ],
      ),
    );
  }
}
