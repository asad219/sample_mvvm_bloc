import 'package:sample_mvvm_bloc/models/movies/movies_model.dart';

abstract class MoviesRepository {
  Future<MoviesModel> fetchedMoviesList();
}
