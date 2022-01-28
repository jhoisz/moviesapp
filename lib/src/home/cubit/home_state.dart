part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<Movie> movies;

  HomeSuccess(this.movies);
}

class HomeError extends HomeState {}
