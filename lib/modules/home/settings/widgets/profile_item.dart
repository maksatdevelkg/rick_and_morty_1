import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback onTap;

  const ProfileItem({
    required this.title,
    required this.value,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.s16w500,
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 14, color: AppColors.textInCharacters),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.textInCharacters),
          ],
        ),
      ),
    );
  }
}
