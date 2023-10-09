import 'package:belajar_api/model/search_movie_model.dart';
import 'package:belajar_api/screen/movie/movie_detail_screen.dart';
import 'package:belajar_api/screen/movie/movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchMovieScreen extends StatelessWidget {
  SearchMovieScreen({super.key});

  List<SearchMovieModel> _listMovie = [];

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: movieProvider.searchMovieController,
              // onChanged: (val) {
              //   movieProvider.getSearchMovie(val);
              // },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              movieProvider.getSearchMovie();
            },
            child: const Text(
              'Search',
            ),
          ),
          Consumer<MovieViewModel>(
            builder: (context, movieProvider, child) {
              return movieProvider.isLoadingSearchMovie
                  ? const CircularProgressIndicator()
                  : movieProvider.listSearchMovieModel.results?.isNotEmpty ==
                          true
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: movieProvider
                                .listSearchMovieModel.results?.length,
                            itemBuilder: (context, index) {
                              var data = movieProvider
                                  .listSearchMovieModel.results?[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MovieDetailScreen(
                                        name: data?.title ?? "-",
                                        idMovie: data?.id.toString() ?? "-",
                                      ),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading: Text("$index"),
                                  title: Text(
                                    data?.title ?? "",
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : const Text(
                          'Data Tidak Ada',
                        );
            },
          )
        ],
      ),
    );
  }
}
