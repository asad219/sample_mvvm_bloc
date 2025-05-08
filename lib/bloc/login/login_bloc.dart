import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sample_mvvm_bloc/repository/auth/login_repository.dart';
import 'package:sample_mvvm_bloc/services/session_manager/session_controller.dart';
import 'package:sample_mvvm_bloc/utils/enums.dart';

part 'login_events.dart';
part 'login_states.dart';

class LoginBloc extends Bloc<LoginEvents, LoginStates> {
  //final LoginRepository _loginRepository = LoginRepository();
  LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(const LoginStates()) {
    on<EmailChangedEvent>(_onEmailChanged);
    on<PasswordChangedEvent>(_onPasswordChanged);
    on<LoginApiEvent>(_onLoginApi);
  }
  void _onEmailChanged(EmailChangedEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(
      PasswordChangedEvent event, Emitter<LoginStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onLoginApi(LoginApiEvent event, Emitter<LoginStates> emit) async {
    Map data = {
      'email': state.email,
      'password': state.password,
    };
    // Map data = {'email': "eve.holt@reqres.in", 'password': "cityslicka"};
    emit(state.copyWith(postApiStatus: PostApiStatus.loading));
    await loginRepository.loginApi(data).then((value) async {
      if (value.error.isNotEmpty) {
        emit(state.copyWith(
            message: value.error.toString(),
            postApiStatus: PostApiStatus.error));
      } else {
        await SessionController().saveUserInPreference(value);
        await SessionController().getUserFromPreference();

        emit(state.copyWith(
            message: value.token.toString(),
            postApiStatus: PostApiStatus.success));
      }
    }).onError((error, stackTrace) {
      emit(state.copyWith(
          message: error.toString(), postApiStatus: PostApiStatus.error));
    });
  }
}
