import 'package:flutter/material.dart';
import 'package:saga/theme/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Splash', style: Prism.text(context).bodyMedium)));
  }
}
