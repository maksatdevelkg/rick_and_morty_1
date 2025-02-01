import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/extensions/string_extension.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';

import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

class CharacterImageWidget extends StatelessWidget {
  const CharacterImageWidget({super.key, required this.character,  });
  final CharacterEntity character;
   
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return SizedBox(
      height: 500,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        character.image,
                      ),
                      fit: BoxFit.cover)),
            ),
          ),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                height: 300,
              ),
            ),
          ),
          Positioned(
            top: 225,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: themeProvider.getColorLight(),
                      shape: BoxShape.circle),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(character.image))),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  character.name,
                  style: AppTextStyle.s34w400
                      ?.copyWith(color: themeProvider.getColorDark()),
                ),
                Text(
                  character.status,
                  style: AppTextStyle.s10w500
                      ?.copyWith(color: character.status.statusColor),
                ),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
