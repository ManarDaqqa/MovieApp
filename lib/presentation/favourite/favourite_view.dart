import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/presentation/resources/assets_manager.dart';
import 'package:movie_app/presentation/resources/color_manager.dart';
import 'package:movie_app/presentation/resources/routes_manager.dart';
import 'package:movie_app/presentation/widgets/favourite_card.dart';

import '../../data/controller/controller.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class FavouriteView extends StatefulWidget {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  State<FavouriteView> createState() => _FavouriteViewState();
}

class _FavouriteViewState extends State<FavouriteView> {
  MovieController movieController = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primColor,
      appBar: AppBar(
        title: Text(
          'Favourite',
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
          onPressed: () => Navigator.pushNamed(context, Routes.mainRoute),
        ),
      ),
      body: Obx(() {
        if (movieController.favouritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset(ImageAssets.addFavourite),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Please, Add your favorites movies.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )
              ],
            ),
          );
        }else{
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                mainAxisExtent: 220,
                childAspectRatio: 0.6
            ),
            itemCount: movieController.favouritesList.length,
            itemBuilder: (context,index){
              return FavouriteCard(index: index);
            },
          );
        }
      }),
    );
  }
}

