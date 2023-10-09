part of 'movie_detail_bloc.dart';

sealed class MovieDetailState extends Equatable {
  const MovieDetailState();
}

final class MovieDetailInitial extends MovieDetailState {
  @override
  List<Object> get props => [];
}

// loading

final class MovieDetailLoading extends MovieDetailState {
  @override
  List<Object> get props => [];
}

// kondisi sukses loaded

final class MovieDetailLoadedSuccess extends MovieDetailState {
  final DetailMovieModel detailMovieModel;

  const MovieDetailLoadedSuccess({required this.detailMovieModel});
  @override
  List<Object?> get props => [detailMovieModel];
}

// kondisi gagal loadedError

final class MovieDetailLoadedError extends MovieDetailState {
  final String messageError;

  const MovieDetailLoadedError({required this.messageError});

  @override
  List<Object?> get props => [messageError];
}
