import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';


@RoutePage()
class ProfileDetailsScreen extends StatelessWidget {
  const ProfileDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.mainDart,
        leading: IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.darkMainText,
            )),
        title: const Text(
          'Edit profile',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              ),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }
}