// import 'package:belajar_api/screen/movie/movie_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class MovieDetailScreen extends StatelessWidget {
//   final String name;
//   final String idMovie;
//   const MovieDetailScreen({
//     super.key,
//     required this.name,
//     required this.idMovie,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<MovieViewModel>(context);

//     provider.getDetailMovie(idMovie);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Detail Movie $name",
//           ),
//         ),
//         body: Consumer<MovieViewModel>(
//           builder: (context, movieProvider, child) {
//             return Column(
//               children: [
//                 Text(
//                   movieProvider.detailMovieModel.originalTitle ?? "",
//                 ),
//               ],
//             );
//           },
//         ));
//   }
// }

import 'package:belajar_api/screen/movie/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailScreen extends StatelessWidget {
  final String name;
  final String idMovie;
  const MovieDetailScreen({
    super.key,
    required this.name,
    required this.idMovie,
  });
  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailBloc>().add(GetDetailMovieEvent(idMovie: idMovie));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Movie $name",
        ),
      ),
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoadedSuccess) {
            return Text(state.detailMovieModel.originalTitle ?? "-");
          } else if (state is MovieDetailLoadedError) {
            return Center(
              child: Text(state.messageError),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
