import 'package:flutter/material.dart';
import 'package:sample_mvvm_bloc/config/color/colors.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPress;
  const AppButton({super.key, 
    required this.title,
    this.color,
    this.textColor,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color ?? AppColors.buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 16,
              
            ),
          ),
        ),
      ),
    );
  }
}