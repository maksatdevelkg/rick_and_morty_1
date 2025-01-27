import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/modules/character_details/widgets/character_image_widget.dart';

import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';

@RoutePage()
class CharacterDelailsScreen extends StatelessWidget {
  const CharacterDelailsScreen({super.key, required this.character});
  final CharacterEntity character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CharacterImageWidget(
          image: character.image,
        ),
      ],
    ));
  }
}
