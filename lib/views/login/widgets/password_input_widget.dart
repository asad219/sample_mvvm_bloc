import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_mvvm_bloc/bloc/login/login_bloc.dart';

class PasswordInputWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  const PasswordInputWidget({super.key, required this.passwordFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => current.password != previous.password,
        builder: (context, state) {
          return TextFormField(
            obscureText: true,
            focusNode: passwordFocusNode,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context
                  .read<LoginBloc>()
                  .add(PasswordChangedEvent(password: value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your password";
              }
              if (state.password.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
          );
        });
  }
}
