import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/presentation/favourite/favourite_view.dart';
import 'package:movie_app/presentation/movies/movies_view.dart';
import 'package:movie_app/presentation/resources/color_manager.dart';
import 'package:movie_app/presentation/resources/values_manager.dart';
import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {


  List pages = [const MoviesView(), const FavouriteView()];
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.primColor,

        body:pages[currentIndex],

        floatingActionButton: SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            elevation: 0,
            child: const CircleAvatar(
              backgroundImage: AssetImage(ImageAssets.firePng),
              maxRadius: 80,
            ),
            onPressed: () {
              Navigator.pushNamed(context, Routes.trendingRoute);
            },
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ColorManager.primColor,
          onTap: onTap,
          elevation: 0,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(fontSize: AppSize.s12),
          selectedItemColor: ColorManager.white,
          unselectedLabelStyle: const TextStyle(fontSize: AppSize.s12),
          unselectedItemColor: ColorManager.lightGrey,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 40,
                width: 20,
                child: SvgPicture.asset(
                  ImageAssets.popcornOutlineIcon,
                ),
              ),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                width: 25,
                child: SvgPicture.asset(
                  ImageAssets.likeIcon,
                ),
              ),
              label: 'Favourites',
            ),
          ],
        )
    );
  }
}
