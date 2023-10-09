part of 'movie_detail_bloc.dart';

sealed class MovieDetailEvent extends Equatable {
  const MovieDetailEvent();
}

class GetDetailMovieEvent extends MovieDetailEvent {
  final String idMovie;

  const GetDetailMovieEvent({required this.idMovie});
  @override
  List<Object> get props => [idMovie];
}
