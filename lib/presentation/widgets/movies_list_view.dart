import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../movie_details/movie_details_view.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';

class MoviesListView extends StatefulWidget {
  const MoviesListView({Key? key}) : super(key: key);

  @override
  State<MoviesListView> createState() => _MoviesListViewState();
}

class _MoviesListViewState extends State<MoviesListView> {
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
                  'Movies',
                  style: getSemiBoldStyle(
                      color: ColorManager.white,
                      fontFamily: FontConstants.fontSecFamily),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieController.popularMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                setState((){
                                  setState((){
                                    movieController.getDetail(movieController.popularMovies[index].id.toString());
                                    movieController.getGenres(movieController.popularMovies[index].id.toString());
                                    movieController.getCastList(movieController.popularMovies[index].id.toString());
                                  });
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
                                      .popularMovies[index].posterPath}',
                                  height: 240,
                                  width: 170,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error,
                                      stackTrace) {
                                    return Container(
                                      height: 240,
                                      width: 170,
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

