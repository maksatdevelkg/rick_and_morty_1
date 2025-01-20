import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/config/app_router.gr.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/home/settings/widgets/profile_widget.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

enum ThemeMode { dark, light }

class SettingsBody extends StatefulWidget {
  const SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getColorLight(),
        title: Text(
          'Settings',
          style: AppTextStyle.s20w500
              ?.copyWith(color: themeProvider.getColorDark()),
        ),
        leading: IconButton(
            onPressed: () {
              context.router.maybePop();
            },
            icon: Icon(
              Icons.arrow_back,
              color: themeProvider.getColorDark(),
            )),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 33,
          ),
          SizedBox(
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(left: 23, right: 16),
              child: ProfileWidget(
                onTap: () {
                  context.router.push(const ProfileDetailsRoute());
                },
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Divider(
              thickness: 1,
              color: themeProvider.currentThemeValue == AppThemeMode.dark
                  ? AppColors.secondaryDart
                  : AppColors.dartMainLine),
          const SizedBox(
            height: 36,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'Theme view',
              style: TextStyle(color: AppColors.darkSecondaryText),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    backgroundColor: themeProvider.getColorLight(),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      'Dark theme',
                      style: TextStyle(color: themeProvider.getColorDark()),
                    ),
                    content: Container(
                      height: 200,
                      width: 340,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            title: Text(
                              'On',
                              style: TextStyle(
                                  color: themeProvider.getColorDark()),
                            ),
                            leading: Icon(
                              themeProvider.currentThemeValue == ThemeMode.dark
                                  ? Icons.radio_button_on
                                  : Icons.radio_button_off,
                            ),
                            onTap: () {
                              themeProvider.applyDarkTheme();
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: Text(
                              'Off',
                              style: TextStyle(
                                  color: themeProvider.getColorDark()),
                            ),
                            leading: Icon(
                              themeProvider.currentThemeValue == ThemeMode.light
                                  ? Icons.radio_button_on
                                  : Icons.radio_button_off,
                            ),
                            onTap: () {
                              themeProvider.applyLightTheme();
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: ListTile(
              leading: Icon(Icons.color_lens_outlined,
                  size: 40, color: themeProvider.getColorDark()),
              title: Text('Dark theme',
                  style: AppTextStyle.s16w400?.copyWith(
                    color: themeProvider.getColorDark(),
                  )),
              subtitle: Text(
                themeProvider.currentThemeValue == AppThemeMode.dark
                    ? 'On'
                    : 'Off',
                style: AppTextStyle.s14w400
                    ?.copyWith(color: AppColors.darkSecondaryText),
              ),
              trailing: Icon(Icons.arrow_forward_ios,
                  size: 15, color: themeProvider.getColorDark()),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          Divider(
              thickness: 1,
              color: themeProvider.currentThemeValue == AppThemeMode.dark
                  ? AppColors.secondaryDart
                  : AppColors.dartMainLine),
          const SizedBox(
            height: 36,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'About application',
              style: TextStyle(color: AppColors.darkSecondaryText),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              'The Zigerions place Jerry and Rick in a simulation to learn the secret of making concentrated dark matter.',
              style: AppTextStyle.s13w400,
            ),
          )
        ],
      ),
    );
  }
}
