part of 'login_bloc.dart';

class LoginStates {
  final String email;
  final String password;
  final PostApiStatus postApiStatus;
  final String message;
  const LoginStates({
    this.email = '',
    this.password = '',
    this.postApiStatus = PostApiStatus.initial,
    this.message = '',
  });

  LoginStates copyWith({
    String? email,
    String? password,
    PostApiStatus? postApiStatus,
    String? message,
  }) {
    return LoginStates(
      email: email ?? this.email,
      password: password ?? this.password,
      postApiStatus: postApiStatus ?? this.postApiStatus,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [email, password, postApiStatus, message];
}
