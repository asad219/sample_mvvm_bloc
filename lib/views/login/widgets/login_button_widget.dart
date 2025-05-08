import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_mvvm_bloc/bloc/login/login_bloc.dart';
import 'package:sample_mvvm_bloc/config/routes/routes_name.dart';
import 'package:sample_mvvm_bloc/utils/enums.dart';
import 'package:sample_mvvm_bloc/utils/flush_bar_helper.dart';

class LoginButtonWidget extends StatelessWidget {
  final formKey;
  const LoginButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginStates>(
      listenWhen: (previous, current) =>
          previous.postApiStatus != current.postApiStatus,
      listener: (context, state) {
        // if (state.postApiStatus == PostApiStatus.loading) {
        //   ScaffoldMessenger.of(context)
        //     ..hideCurrentSnackBar()
        //     ..showSnackBar(SnackBar(content: Text("Submitting...")));
        // }
        if (state.postApiStatus == PostApiStatus.error) {
          FlushBarHelper.flushBarMessage(
              state.message.toString(), true, context);
        }
        if (state.postApiStatus == PostApiStatus.success) {
          Navigator.pushNamed(context, RoutesName.homeScreen);
          FlushBarHelper.flushBarMessage('Login Successfull', false, context);
        }
      },
      child: BlocBuilder<LoginBloc, LoginStates>(
          buildWhen: (previous, current) =>
              current.postApiStatus != previous.postApiStatus,
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginBloc>().add(LoginApiEvent());
                }
              },
              child: state.postApiStatus == PostApiStatus.loading
                  ? SizedBox(
                      height: 15,
                      width: 15,
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                      ))
                  : Text("Login"),
            );
          }),
    );
  }
}
