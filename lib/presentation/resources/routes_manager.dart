import 'package:flutter/material.dart';
import 'package:movie_app/presentation/favourite/favourite_view.dart';
import 'package:movie_app/presentation/movies/movies_view.dart';
import 'package:movie_app/presentation/resources/strings_manager.dart';
import 'package:movie_app/presentation/trending/trending_view.dart';
import '../main/main_view.dart';
import '../movie_details/movie_details_view.dart';
import '../splash/splash_view.dart';

class Routes{
  static const String splashRoute = "/";
  static const String trendingRoute = "/trending";
  static const String favouriteRoute = "/favourite";
  static const String moviesRoute = "/movies";
  static const String mainRoute = "/main";
  static const String movieDetailsRoute = "/movieDetails";

}

class RouteGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.trendingRoute:
        return MaterialPageRoute(builder: (_) => const TrendingView());
      case Routes.favouriteRoute:
        return MaterialPageRoute(builder: (_) => const FavouriteView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.moviesRoute:
        return MaterialPageRoute(builder: (_) => const MoviesView());
      case Routes.movieDetailsRoute:
        return MaterialPageRoute(builder: (_) =>  const MovieDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=>
        Scaffold(
          appBar: AppBar
            (title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(
              child: Text(AppStrings.noRouteFound),
          ),
        ));
  }
}