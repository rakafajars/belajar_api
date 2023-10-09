import 'package:belajar_api/model/detail_movie_model.dart';
import 'package:belajar_api/model/search_movie_model.dart';
import 'package:dio/dio.dart';

class MovieApi {
  Future<SearchMovieModel> getSearchMovie({required String query}) async {
    try {
      final response = await Dio().get(
        'https://api.themoviedb.org/3/search/movie?query=$query',
        options: Options(
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjBkZWJlMDUzNTM1NGZkNDViM2I4NmE4MWZkMzVhMiIsInN1YiI6IjVlNjk5ZGU4Y2VkYWM0MDAxNTQ2YmMyYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.X6XeWeTtRu1bibtfYujUyi_m0bdVmwK8bFastHyZVfk"
          },
        ),
      );

      return SearchMovieModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailMovieModel> getDetailMovie(String idMovie) async {
    try {
      final response = await Dio().get(
        'https://api.themoviedb.org/3/movie/$idMovie',
        options: Options(
          headers: {
            'Authorization':
                "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjBkZWJlMDUzNTM1NGZkNDViM2I4NmE4MWZkMzVhMiIsInN1YiI6IjVlNjk5ZGU4Y2VkYWM0MDAxNTQ2YmMyYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.X6XeWeTtRu1bibtfYujUyi_m0bdVmwK8bFastHyZVfk"
          },
        ),
      );

      return DetailMovieModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
