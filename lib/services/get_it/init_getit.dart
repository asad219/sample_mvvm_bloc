import 'package:get_it/get_it.dart';
import 'package:sample_mvvm_bloc/repository/auth/login_http_api_repository.dart';
import 'package:sample_mvvm_bloc/repository/auth/login_repository.dart';
import 'package:sample_mvvm_bloc/repository/movies/movies_http_api_repository.dart';
import 'package:sample_mvvm_bloc/repository/movies/movies_repository.dart';

GetIt getIt = GetIt.instance;
void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
  getIt
      .registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository());
}
