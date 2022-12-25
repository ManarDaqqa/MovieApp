import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/resources/color_manager.dart';
import '../../data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../movie_details/movie_details_view.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class NowPlayingMoviesListView extends StatefulWidget {
  const NowPlayingMoviesListView({Key? key}) : super(key: key);

  @override
  State<NowPlayingMoviesListView> createState() => _NowPlayingMoviesListViewState();
}

class _NowPlayingMoviesListViewState extends State<NowPlayingMoviesListView> {
  MovieController movieController = Get.put(MovieController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
        builder: (controller){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Now Playing',
                  style: getSemiBoldStyle(color: ColorManager.white,
                      fontFamily: FontConstants.fontSecFamily),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieController.nowPlayingMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                  setState((){
                                    movieController.getDetail(movieController.nowPlayingMovies[index].id.toString());
                                    movieController.getGenres(movieController.nowPlayingMovies[index].id.toString());
                                    movieController.getCastList(movieController.nowPlayingMovies[index].id.toString());
                                  });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          MovieDetailsView(),
                                    ));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  '${ApiConstants
                                      .baseImgUrl}${movieController
                                      .nowPlayingMovies[index]
                                      .posterPath}',
                                  height: 133,
                                  width: 242,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error,
                                      stackTrace) {
                                    return Container(
                                      height: 133,
                                      width: 242,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
    );
      }
  }

