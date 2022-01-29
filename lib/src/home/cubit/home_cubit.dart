import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moviesapp/src/home/models/movie.dart';
import 'package:moviesapp/src/home/services/home_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeService = HomeService();

  Future<void> fetchMovies() async {
    emit(HomeLoading());

    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSuccess(movies));
    } catch (error) {
      emit(HomeError('There was an error fetching the movies'));
    }
  }

  Future<void> searchMovie(String query) async {
    Timer? timer;
    if (timer?.isActive ?? false) {
      timer!.cancel();
    }

    timer = Timer(const Duration(seconds: 1), () async {
      emit(HomeLoading());

      try {
        final movie = await homeService.searchMovie(query);
        emit(HomeSuccess(movie));
      } catch (error) {
        emit(HomeError('There was an error finding movie'));
      }
    });
  }
}
