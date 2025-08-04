import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/home/settings/widgets/first_name_details_screen.dart';
import 'package:rick_and_morty_1/modules/home/settings/widgets/login_details_screen.dart';
import 'package:rick_and_morty_1/modules/home/settings/widgets/profile_item.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/profile_provider.dart';
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
    final profile = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: themeProvider.getColorLight(),
        leading: IconButton(
          onPressed: () {
            context.router.maybePop();
          },
          icon: Icon(Icons.arrow_back, color: themeProvider.getColorDark()),
        ),
        title: Text(
          'Edit profile',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: themeProvider.getColorDark()),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Изменить фото',
                  style: AppTextStyle.s16w400!
                      .copyWith(color: AppColors.buttonColor)),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Profile',
                      style: AppTextStyle.s14w500!
                          .copyWith(color: AppColors.textInCharacters),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ProfileItem(
                    title: 'Изменить ФИО',
                    value:
                        '${profile.firstName} ${profile.lastName} ${profile.middleName}',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const FirstNameDetailsScreen()),
                      );
                    },
                  ),
                  ProfileItem(
                      title: 'Login',
                      value: '${profile.loginName} ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginDetailsScreen()),
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
