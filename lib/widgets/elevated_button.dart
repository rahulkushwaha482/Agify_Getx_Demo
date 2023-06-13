import 'package:agify_getx_demo/constant/app_theme.dart';
import 'package:flutter/material.dart';

class ElevatedButtonText extends StatelessWidget {
  final String buttonText;
  final dynamic onPressed;
  final double? buttonHorizontalPadding;
  final double? buttonPadding;
  final double? borderRadius;
  final bool isLoading;

  const ElevatedButtonText({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonHorizontalPadding,
    this.buttonPadding,
    this.borderRadius,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 25.0,
      ),
      child: ElevatedButton(
        child: Padding(
          padding: EdgeInsets.all(buttonPadding ?? 10),
          child: Center(
            child: (isLoading)
                ? const SizedBox(
                    height: 23,
                    width: 23,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(buttonText, style: const TextStyle(fontSize: 20)),
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.kDarkBlue,
          primary: AppTheme.kDarkBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
        ),
      ),
    );
  }
}
