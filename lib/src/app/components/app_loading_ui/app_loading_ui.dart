import 'package:flutter/material.dart';

class AppLoading extends StatefulWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  State<AppLoading> createState() => _AppLoadingState();
}

class _AppLoadingState extends State<AppLoading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
