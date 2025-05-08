import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_mvvm_bloc/bloc/login/login_bloc.dart';
import 'package:sample_mvvm_bloc/utils/validations.dart';

class EmailInputWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  const EmailInputWidget({super.key, required this.emailFocusNode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginStates>(
        buildWhen: (current, previous) => current.email != previous.email,
        builder: (context, state) {
          return TextFormField(
            focusNode: emailFocusNode,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              context.read<LoginBloc>().add(EmailChangedEvent(email: value));
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your email";
              }
              if (!Validations.emailValidator(value)) {
                return "Please enter a valid email";
              }
              return null;
            },
          );
        });
  }
}
