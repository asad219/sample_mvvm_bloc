import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_mvvm_bloc/data/response/api_response.dart';
import 'package:sample_mvvm_bloc/models/movies/movies_model.dart';
import 'package:sample_mvvm_bloc/repository/movies/movies_repository.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesRepository moviesRepository;
  MoviesBloc({required this.moviesRepository})
      : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_fetchedMoviesListApi);
  }
  void _fetchedMoviesListApi(
      MoviesFetched event, Emitter<MoviesState> emit) async {
    await moviesRepository.fetchedMoviesList().then((value) {
      emit(state.copyWith(
        moviesList: ApiResponse.completed(value),
      ));
    }).onError((error, stackTrace) {
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString()),
      ));
    });
  }
}
