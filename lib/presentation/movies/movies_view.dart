import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/controller.dart';
import '../widgets/app_bar_view.dart';
import '../widgets/movies_list_view.dart';
import '../widgets/now_playing_movies_list_view.dart';
import '../widgets/upcoming_movies_list_view.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            AppBarView(),
            const NowPlayingMoviesListView(),
            const UpcomingMoviesListView(),
            const MoviesListView(),
          ],
        );
      }
}
