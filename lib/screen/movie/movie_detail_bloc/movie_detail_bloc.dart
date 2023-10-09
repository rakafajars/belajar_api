import 'package:belajar_api/model/api/movie_api.dart';
import 'package:belajar_api/model/detail_movie_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<GetDetailMovieEvent>((event, emit) async {
      try {
        emit(MovieDetailLoading());
        final data = await MovieApi().getDetailMovie(event.idMovie);

        emit(
          MovieDetailLoadedSuccess(
            detailMovieModel: data,
          ),
        );
      } catch (e) {
        emit(
          const MovieDetailLoadedError(
            messageError: 'Gagal Mendapatkan Detail',
          ),
        );
      }
    });
  }
}
