import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/resources/color_manager.dart';
import 'package:movie_app/presentation/resources/styles_manager.dart';
import 'package:movie_app/presentation/resources/values_manager.dart';
import '../../data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../resources/font_manager.dart';
import '../widgets/cast_widget.dart';

class MovieDetailsView extends StatefulWidget {
  const MovieDetailsView({Key? key}) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  MovieController movieController = Get.put(MovieController());
  Color enableColor = ColorManager.error;
  Color disableColor = ColorManager.white;
  bool enabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primColor,
        body: GetBuilder<MovieController>(
            builder: (controller) => movieController.isLoading.value
                ? CircularProgressIndicator(color: ColorManager.white)
                : SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 375,
                                width: 375,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        ApiConstants.baseImgUrl +
                                            movieController
                                                .movies.value.backdropPath
                                                .toString()),
                                    fit: BoxFit.fill,
                                    opacity: 0.8,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: ColorManager.white,
                                      size: AppSize.s22,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          enabled = !enabled;
                                          if (enabled == true) {
                                            movieController.manageFavourites(movieController.movies.value.id.toString());
                                          }
                                          else {
                                            movieController.deleteFavourites(
                                                movieController.movies.value.id
                                                    .toString());
                                          }
                                        });
                                      },
                                      child: Icon(
                                        enabled
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: enabled
                                            ? enableColor
                                            : disableColor,
                                        size: AppSize.s24,
                                      )),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: AppPadding.p18),
                                    child: Text(
                                      movieController.movies.value.originalTitle
                                          .toString(),
                                      style: getSemiBoldStyle(
                                          color: ColorManager.white,
                                          fontSize: AppSize.s24,
                                          fontFamily: FontConstants.fontFamily),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  'Overview',
                                  style: getLightStyle(
                                      color: ColorManager.white,
                                      fontSize: AppSize.s18,
                                      fontFamily: FontConstants.fontFamily),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  movieController.movies.value.overview
                                      .toString(),
                                  style: getRegularStyle(
                                      color: ColorManager.white,
                                      fontFamily: FontConstants.fontFamily),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 22),
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    movieController.movies.value.genres?.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 6),
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: Container(
                                          alignment: Alignment.centerRight,
                                          constraints: const BoxConstraints(
                                            maxWidth: 80,
                                            maxHeight: 37,
                                          ),
                                          color: ColorManager.lightGrey,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              movieController.movies.value
                                                  .genres![index].name
                                                  .toString(),
                                              style: getMediumStyle(
                                                  color: ColorManager.mainBlack,
                                                  fontFamily: FontConstants
                                                      .fontSecFamily),
                                            ),
                                          ),
                                        )),
                                  );
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cast',
                                  style: getSemiBoldStyle(
                                      color: ColorManager.white,
                                      fontFamily: FontConstants.fontSecFamily),
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  height: 180,
                                  color: ColorManager.primColor,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        movieController.movieCast.length <= 10
                                            ? movieController.movieCast.length
                                            : 10,
                                    itemBuilder: (context, index) {
                                      return movieController
                                              .movieCast.isNotEmpty
                                          ? CastWidget(
                                              imgUrl: ApiConstants.baseImgUrl +
                                                  movieController
                                                      .movieCast[index]
                                                      .profilePath
                                                      .toString(),
                                              castName: movieController
                                                  .movieCast[index].name
                                                  .toString(),
                                            )
                                          : const CircularProgressIndicator();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )));
  }
}
