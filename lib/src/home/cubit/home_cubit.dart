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
      emit(HomeError());
    }
  }
}
