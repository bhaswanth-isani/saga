import 'package:flutter/material.dart';
import 'package:saga/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile', style: Prism.text(context).bodyMedium));
  }
}
