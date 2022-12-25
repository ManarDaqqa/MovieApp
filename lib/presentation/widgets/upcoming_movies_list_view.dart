import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/movie_details/movie_details_view.dart';
import 'package:movie_app/data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';


class UpcomingMoviesListView extends StatefulWidget {
  const UpcomingMoviesListView({Key? key})
      : super(key: key);

  @override
  State<UpcomingMoviesListView> createState() => _UpcomingMoviesListViewState();
}

class _UpcomingMoviesListViewState extends State<UpcomingMoviesListView> {
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
                  'Upcoming',
                  style: getSemiBoldStyle(color: ColorManager.white,fontFamily: FontConstants.fontSecFamily),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movieController.upcomingMovies.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState((){
                                  movieController.getDetail(movieController.upcomingMovies[index].id.toString());
                                  movieController.getGenres(movieController.upcomingMovies[index].id.toString());
                                  movieController.getCastList(movieController.upcomingMovies[index].id.toString());
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
                                  '${ApiConstants.baseImgUrl}${movieController.upcomingMovies[index].posterPath}',
                                  height: 200,
                                  width: 140,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 200,
                                      width: 140,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),
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
