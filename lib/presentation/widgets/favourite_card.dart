import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/api_constants.dart';
import '../../data/controller/controller.dart';
import '../movie_details/movie_details_view.dart';
import '../resources/color_manager.dart';
import '../resources/values_manager.dart';


class FavouriteCard extends StatefulWidget {
  const FavouriteCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<FavouriteCard> createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    movieController.getDetail(
                        movieController.favouritesList[widget.index].id
                            .toString());
                    movieController.getCastList(
                        movieController.favouritesList[widget.index].id
                            .toString());
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
                    '${ApiConstants.baseImgUrl}${movieController
                        .favouritesList[widget.index].posterPath}',
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
                        movieController.deleteFavourites(movieController.favouritesList[widget.index].id.toString());
                      },
                      child: movieController.isFavourites(
                          movieController.favouritesList[widget.index].id.toString()) ?
                      Icon(
                        Icons.favorite,
                        color: ColorManager.error,
                        size: AppSize.s20,
                      )  : Icon(
                        Icons.favorite_outline,
                        color: ColorManager.white,
                        size: AppSize.s20,
                      )
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
  }
}
