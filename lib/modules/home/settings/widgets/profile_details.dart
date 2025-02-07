import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

@RoutePage()
class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  _ProfileDetailsScreenState createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
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
          ),
        ),
        title: Text(
          'Edit profile',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: themeProvider.getColorDark()),
        ),
      ),
      body: Column(
        children: [ CircleAvatar(radius: 100, backgroundColor: Colors.white,),
        
        
        ],
      ),
    );
  }
}
