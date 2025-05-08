import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback? onRetry;
  const InternetExceptionWidget({required this.onRetry, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.wifi_off,
            size: 50,
            color: Colors.red,
          ),
           SizedBox(height: 20),
          Text(
            'No Internet Connection',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 15,
            )),
          
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}