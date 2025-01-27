import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

class CharacterImageWidget extends StatelessWidget {
  const CharacterImageWidget({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        image,
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
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: themeProvider.getColorDark(), shape: BoxShape.circle),
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: NetworkImage(image))),
              ),
            ),
          )
        ],
      );
  }
}