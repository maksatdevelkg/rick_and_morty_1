import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';

class MainBottomNavigationItem extends StatelessWidget {
  const MainBottomNavigationItem({
    super.key,
    required this.icon,
    required this.lable,
    required this.isActive,
    required this.onTap,
  });
  final String icon;
  final String lable;
  final bool isActive;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
              height: 30,
              child: SvgPicture.asset(
                icon,
                color: isActive ? AppColors.green : AppColors.darkSecondaryText,
              )),
          Text(
            lable,
            style: TextStyle(
                color: isActive ? AppColors.green : AppColors.darkSecondaryText,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
