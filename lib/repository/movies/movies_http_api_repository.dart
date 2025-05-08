import 'package:sample_mvvm_bloc/config/app_url.dart';
import 'package:sample_mvvm_bloc/data/network/network_services_api.dart';
import 'package:sample_mvvm_bloc/models/movies/movies_model.dart';
import 'package:sample_mvvm_bloc/repository/movies/movies_repository.dart';

class MoviesHttpApiRepository extends MoviesRepository {
  final _apiService = NetworkServicesApi();

  @override
  Future<MoviesModel> fetchedMoviesList() async {
    final response = await _apiService.getApi(AppUrl.popularMoviesListEndPoint);
    return MoviesModel.fromJson(response);
  }
}
