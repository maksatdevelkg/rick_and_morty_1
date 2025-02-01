import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/character_details/widgets/character_image_widget.dart';

import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

@RoutePage()
class CharacterDelailsScreen extends StatelessWidget {
  const CharacterDelailsScreen({
    super.key,
    required this.character,
  });
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        body: Column(
      children: [
        CharacterImageWidget(
          character: character,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Gender: \n ',
                    style: AppTextStyle.s12w400
                        ?.copyWith(color: AppColors.textInCharacters),
                  ),
                  Text(
                    character.gender,
                    style: AppTextStyle.s14w400
                        ?.copyWith(color: themeProvider.getColorDark()),
                  ),
                ],
              ),
              const SizedBox(
                width: 150,
              ),
              Column(
                children: [
                  Text(
                    'Species: \n ',
                    style: AppTextStyle.s12w400
                        ?.copyWith(color: AppColors.textInCharacters),
                  ),
                  Text(
                    character.species,
                    style: AppTextStyle.s14w400
                        ?.copyWith(color: themeProvider.getColorDark()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
