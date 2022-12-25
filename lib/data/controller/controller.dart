import 'package:get/get.dart';
import '../../domain/models.dart';
import '../api_client.dart';

class MovieController extends GetxController {
  ApiClient apiClient = ApiClient();

  List<MovieModel> trendingMovies = <MovieModel>[].obs;
  List<MovieModel> topRatedMovies = <MovieModel>[].obs;
  List<MovieModel> popularMovies = <MovieModel>[].obs;
  List<MovieModel> upcomingMovies = <MovieModel>[].obs;
  List<MovieModel> nowPlayingMovies = <MovieModel>[].obs;
  List<MovieModel> similarMovies = <MovieModel>[].obs;
  List<MovieModel> searchedMovies = <MovieModel>[].obs;
  List<Genres> genreMovies = <Genres>[].obs;
  List<CastModel> movieCast = <CastModel>[].obs;
  var favouritesList = <MovieModel>[].obs;
  var isLoading = true.obs;



  var movies = MovieDetailModel(
    adult: null,
    backdropPath: null,
    genreIds: null,
    id: null,
    originalLanguage: null,
    originalTitle: null,
    overview: null,
    popularity: null,
    posterPath: null,
    releaseDate: null,
    title: null,
    video: null,
    voteAverage: null,
    voteCount: null,
    genres: null
  ).obs;

  @override
  void onInit() {
    getUpcoming();
    getToprated();
    getNowPlaying();
    getTrending();
    getPopular();
    super.onInit();
  }

  void getTrending() async {
    var movies = await apiClient.getTrendingMovies();
    if (movies.isNotEmpty) {
      trendingMovies = movies;
    }
    update();
  }

  void getNowPlaying() async {
    var movies = await apiClient.getNowPlayingMovies();
    if (movies.isNotEmpty) {
      nowPlayingMovies = movies;
    }
    update();
  }

  void getToprated() async {
    var movies = await apiClient.getTopratedMovies();
    if (movies.isNotEmpty) {
      topRatedMovies = movies;
    }
    update();
  }

  void getPopular() async {
    var movies = await apiClient.getPopularMovies();
    try {
      isLoading(true);
    if (movies.isNotEmpty) {
      popularMovies = movies;
    }
    update();
    }
    finally{
      isLoading(false);
    }
  }

  void getUpcoming() async {
    var movies = await apiClient.getUpcomingMovies();

    try {
      isLoading(true);
      if (movies.isNotEmpty) {
        upcomingMovies = movies;
      }
      update();
    }
    finally{
      isLoading(false);
    }
  }

  void getGenres(String id) async {
    var genres = await apiClient.getMovieGenre(id);
    if (genres.isNotEmpty) {
      genreMovies = genres;
    }
    update();
  }

  void getCastList(String id) async {
    var cast = await apiClient.getMovieCast(id);
    if (cast.isNotEmpty) {
      movieCast = cast;
    }
    update();
  }

  void getMovieSearch(String movieTitle) async {
    var search = await apiClient.getSearchedMovies(movieTitle);
    if (search.isNotEmpty) {
      searchedMovies = search;
    }
    update();
  }

  void getDetail(String id) async {
    var movie = await apiClient.getMovieDetails(id);

    try {
      isLoading(true);

    movies(movie);
    update();}
    finally{
      isLoading(false);
    }

  }


  void manageFavourites(String id){



      favouritesList.add(nowPlayingMovies.firstWhere((element) => element.id == id));
      // favouritesList.every((element) => (element.id != id)) ?
      favouritesList.add(upcomingMovies.firstWhere((element) => element.id == id));
      favouritesList.add(trendingMovies.firstWhere((element) => element.id == id));
      favouritesList.add(popularMovies.firstWhere((element) => element.id == id));


      // favouritesList.every((e) => e.id)
    // }



  }
  bool isFavourites(String id){

    return favouritesList.any((element) => element.id == id);


  }

  void deleteFavourites(String id){
     favouritesList.removeWhere((e) => e.id == id);
  }

}
