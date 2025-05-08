import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_mvvm_bloc/bloc/movies/bloc/movies_bloc.dart';
import 'package:sample_mvvm_bloc/config/routes/routes_name.dart';
import 'package:sample_mvvm_bloc/services/get_it/init_getit.dart';
import 'package:sample_mvvm_bloc/services/storage/local_storage.dart';
import 'package:sample_mvvm_bloc/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late MoviesBloc moviesBloc;
  @override
  void initState() {
    super.initState();
    moviesBloc = MoviesBloc(moviesRepository: getIt());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.sunny)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.language_sharp)),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Handle logout action
              LocalStorage localStorage = LocalStorage();
              await localStorage.clearValue('user').then((value) async {
                await localStorage.setValue('isLogin', 'false');
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesName
                      .loginScreen, // Replace with your login screen route name
                  (route) => false,
                );
              });
            },
          ),
        ],
      ),
      body: BlocProvider(
          create: (_) => moviesBloc,
          child: BlocBuilder<MoviesBloc, MoviesState>(
              builder: (BuildContext context, state) {
            switch (state.moviesList.status) {
              case Status.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case Status.completed:
                // TODO: Handle this case.
                return Text("Done");
              case Status.error:
                // TODO: Handle this case.
                return Center(
                  child: Text(state.moviesList.message.toString()),
                );
              case null:
                // TODO: Handle this case.
                throw UnimplementedError();
            }
          })),
    );
  }
}
