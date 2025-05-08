import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final double size;
  const LoadingWidget({super.key, this.size = 60});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: Center(
        child: Platform.isAndroid
            ? CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.blue,
              )
            : CupertinoActivityIndicator(
                radius: 20,
                color: Colors.blue,
              ),
      ),
    );
  }
}
