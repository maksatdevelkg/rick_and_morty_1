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
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();

  void _saveProfile() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String middleName = _middleNameController.text;

    print("First Name: $firstName");
    print("Last Name: $lastName");
    print("Middle Name: $middleName");
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _middleNameController.dispose();
    super.dispose();
  }

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
        title: const Text(
          'Edit profile',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'First name',
              style: AppTextStyle.s14w400,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.currentThemeValue == AppThemeMode.dark
                    ? AppColors.secondaryDart
                    : AppColors.dartMainLine,
                hintText: 'First name',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkSecondaryText),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Last name',
              style: AppTextStyle.s14w400,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.currentThemeValue == AppThemeMode.dark
                    ? AppColors.secondaryDart
                    : AppColors.dartMainLine,
                hintText: 'Last name',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkSecondaryText),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Middle name',
              style: AppTextStyle.s14w400,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _middleNameController,
              decoration: InputDecoration(
                filled: true,
                fillColor: themeProvider.currentThemeValue == AppThemeMode.dark
                    ? AppColors.secondaryDart
                    : AppColors.dartMainLine,
                hintText: 'Middle name',
                hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkSecondaryText),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 300),
            Center(
              child: SizedBox(
                  height: 55,
                  width: 400,
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text(
                      'Save',
                      style: AppTextStyle.s16w400!
                          .copyWith(color: AppColors.dartMainLine),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 24),
                      textStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ).copyWith(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), 
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}