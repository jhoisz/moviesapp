import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviesapp/src/home/cubit/home_cubit.dart';
import 'widgets/movie_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeCubit = HomeCubit();

  @override
  void initState() {
    homeCubit.fetchMovies();
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
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 6),
                )
              ],
            ),
            child: TextFormField(
              onChanged: (text) {
                if (text.isNotEmpty) {
                  homeCubit.searchMovie(text);
                } else {
                  homeCubit.fetchMovies();
                }
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Search',
                hintStyle: TextStyle(
                  color: Color(0xFF7E7E7E),
                  fontSize: 14,
                ),
                // border: disabledBorder,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),

          //MOVIES TEXT
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
            child: Text(
              'Movies',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeCubit, HomeState>(
              bloc: homeCubit,
              builder: (context, state) {
                if (state is HomeSuccess) {
                  return GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio:
                        ((MediaQuery.of(context).size.width / 1.8) /
                            (MediaQuery.of(context).size.height / 2.9)),
                    children: List.generate(
                      state.movies.length,
                      (index) {
                        final movie = state.movies[index];
                        return MovieCard(movie: movie);
                      },
                    ),
                  );
                } else if (state is HomeLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeError) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error,
                        size: 30.0,
                      ),
                      const SizedBox(height: 15.0),
                      Text(
                        state.error,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      )
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
