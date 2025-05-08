import 'package:flutter/material.dart';
import 'package:sample_mvvm_bloc/config/routes/routes.dart';
import 'package:sample_mvvm_bloc/config/routes/routes_name.dart';
import 'package:sample_mvvm_bloc/services/get_it/init_getit.dart';

void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: (settings) {
        return Routes.generateRoute(settings);
      },
    );
  }
}
