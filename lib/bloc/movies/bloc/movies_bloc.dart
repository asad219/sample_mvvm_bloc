import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_mvvm_bloc/data/response/api_response.dart';
import 'package:sample_mvvm_bloc/models/movies/movies_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc(super.initialState);
}
