import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({ Key? key, required this.imageMovie, required this.nameMovie}) : super(key: key);

  final String imageMovie;
  final String nameMovie;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: MediaQuery.of(context).size.width/2,
      padding: const EdgeInsets.fromLTRB(30, 15.0, 30, 15.0),
      alignment: Alignment.center,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
        //IMAGE
          Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(imageMovie),
                fit: BoxFit.fill
              )
            ),
          ),
          //MOVIE NAME
          Container(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: Text(
                nameMovie,
                // textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 13
                )
            )
          ),
        ],
      )
    );
  }
}