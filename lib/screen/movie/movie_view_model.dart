import 'package:belajar_api/model/api/movie_api.dart';
import 'package:belajar_api/model/detail_movie_model.dart';
import 'package:belajar_api/model/search_movie_model.dart';
import 'package:flutter/material.dart';

class MovieViewModel extends ChangeNotifier {
  // FUNGI FITUR SEARCH
  bool _isLoadingSearchMovie = false;
  bool get isLoadingSearchMovie => _isLoadingSearchMovie;

  final TextEditingController _searchMovieController = TextEditingController();
  TextEditingController get searchMovieController => _searchMovieController;

  SearchMovieModel _listSearchMovieModel = SearchMovieModel();
  SearchMovieModel get listSearchMovieModel => _listSearchMovieModel;

  void getSearchMovie(
      // String query,
      ) async {
    _isLoadingSearchMovie = true;
    notifyListeners();
    final response = await MovieApi().getSearchMovie(
      query: _searchMovieController.text,
      // query: query,
    );

    _listSearchMovieModel = response;

    _isLoadingSearchMovie = false;
    notifyListeners();
  }
  // END FITUR SEARCH

  // Fitur Detail Movie
  // bool _isLoadingDetailMovie = false;
  // bool get isLoadingDetailMovie => _isLoadingDetailMovie;

  DetailMovieModel _detailMovieModel = DetailMovieModel();

  DetailMovieModel get detailMovieModel => _detailMovieModel;

  void getDetailMovie(String idMovie) async {
    // _isLoadingDetailMovie = true;

    _detailMovieModel = await MovieApi().getDetailMovie(
      idMovie,
    );

    // _isLoadingDetailMovie = false;
    notifyListeners();
  }

  // End Detail Movie
}
