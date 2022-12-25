import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/resources/font_manager.dart';
import 'package:movie_app/presentation/resources/styles_manager.dart';
import '../../data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../movie_details/movie_details_view.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';

class TrendingView extends StatefulWidget {
  const TrendingView({Key? key}) : super(key: key);

  @override
  State<TrendingView> createState() => _TrendingViewState();
}

class _TrendingViewState extends State<TrendingView> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(builder: (controller) {
      return Scaffold(
        backgroundColor: ColorManager.primColor,
        appBar: AppBar(
          title: Text(
            'Trending',
            style: getSemiBoldStyle(
                color: ColorManager.white,
                fontFamily: FontConstants.fontFamily,
                fontSize: AppSize.s20),
          ),
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorManager.white,
              size: AppSize.s22,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: movieController.trendingMovies.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState((){
                                    movieController.getDetail(movieController.trendingMovies[index].id.toString());
                                    movieController.getCastList(movieController.trendingMovies[index].id.toString());
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MovieDetailsView(),
                                      ));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '${ApiConstants.baseImgUrl}${movieController.trendingMovies[index].posterPath}',
                                    height: 207,
                                    width: 334,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 207,
                                        width: 334,
                                        color: Colors.grey,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(AppPadding.p14),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () {
                                      setState((){
                                        movieController.favouritesList.every((element) => element.id == movieController.trendingMovies[index].id)
                                            ? movieController.manageFavourites( movieController.trendingMovies[index].id.toString()) :
                                              movieController.deleteFavourites(movieController.trendingMovies[index].id.toString());

                                      });

                                    },
                                    child: movieController.favouritesList.every((element) => element.id == movieController.trendingMovies[index].id) ?
                                    Icon(
                                        Icons.favorite,
                                        color: ColorManager.error,
                                        size: AppSize.s22) : Icon(
                                        Icons.favorite_outline,
                                        color: ColorManager.white,
                                        size: AppSize.s22),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
