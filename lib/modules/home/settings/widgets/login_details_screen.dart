import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/profile_provider.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

class LoginDetailsScreen extends StatefulWidget {
  const LoginDetailsScreen({super.key});

  @override
  State<LoginDetailsScreen> createState() => _LoginDetailsScreenState();
}

class _LoginDetailsScreenState extends State<LoginDetailsScreen> {
  final TextEditingController _loginNameController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profile = Provider.of<ProfileProvider>(context, listen: false);
    _loginNameController.text = profile.loginName;
  }

  @override
  void dispose() {
    _loginNameController.dispose();
    super.dispose();
  }

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
          icon: Icon(
            Icons.arrow_back,
            color: themeProvider.getColorDark(),
          ),
        ),
        title: Text(
          'Login',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: themeProvider.getColorDark()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: AppTextStyle.s14w400,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z ]*$')),
                ],
                controller: _loginNameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      themeProvider.currentThemeValue == AppThemeMode.dark
                          ? AppColors.secondaryDart
                          : AppColors.dartMainLine,
                  hintText: 'Login name',
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.darkSecondaryText),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 500),
              Center(
                child: SizedBox(
                    height: 55,
                    width: 400,
                    child: ElevatedButton(
                      onPressed: () {
                        profile.updateProfile(
                          loginName: _loginNameController.text,
                        );
                        Navigator.pop(context);
                      },
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
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
