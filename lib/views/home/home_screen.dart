import 'package:flutter/material.dart';
import 'package:sample_mvvm_bloc/config/routes/routes_name.dart';
import 'package:sample_mvvm_bloc/services/storage/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Screen'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
