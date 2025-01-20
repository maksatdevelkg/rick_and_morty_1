import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    required this.onTap,
    super.key,
  });
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor:
                    themeProvider.currentThemeValue == AppThemeMode.light
                        ? Colors.black
                        : Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Aibek Kalykov',
                    style: AppTextStyle.s16w400,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Rick',
                    style: AppTextStyle.s14w400,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: onTap,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.buttonColor,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  backgroundColor:
                      themeProvider.currentThemeValue == AppThemeMode.dark
                          ? AppColors.mainDart
                          : Colors.white,
                  elevation: 0,
                ),
                child: Text('Edit',
                    style: AppTextStyle.s16w400?.copyWith(
                      color: AppColors.buttonColor,
                    ))),
          )
        ],
      ),
    );
  }
}
