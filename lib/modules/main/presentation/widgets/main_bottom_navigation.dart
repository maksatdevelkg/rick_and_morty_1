import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/assets/icon_assets.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';
import 'package:rick_and_morty_1/modules/main/presentation/widgets/main_bottom_navigation_item.dart';

class MainBottomNavigation extends StatelessWidget {
  const MainBottomNavigation({super.key, required this.activeIndex});

  final ValueNotifier<int> activeIndex;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ValueListenableBuilder(
        valueListenable: activeIndex,
        builder: (context, value, child) {
          return Container(
            color: themeProvider.currentThemeValue == AppThemeMode.dark
                ? AppColors.secondaryDart
                : Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MainBottomNavigationItem(
                  onTap: () => activeIndex.value = 0,
                  icon: IconAssets.charactersSvg,
                  lable: 'Персонажи',
                  isActive: value == 0,
                ),
                MainBottomNavigationItem(
                  onTap: () => activeIndex.value = 1,
                  icon: IconAssets.locationsSvg,
                  lable: 'Локации',
                  isActive: value == 1,
                ),
                MainBottomNavigationItem(
                  onTap: () => activeIndex.value = 2,
                  icon: IconAssets.episodesSvg,
                  lable: 'Эпизоды', 
                  isActive: value == 2,
                ),
                MainBottomNavigationItem(
                  onTap: () => activeIndex.value = 3,
                  icon: IconAssets.settingsSvg,
                  lable: 'Настройки',
                  isActive: value == 3,
                ),
              ],
            ),
          );
        });
  }
}
