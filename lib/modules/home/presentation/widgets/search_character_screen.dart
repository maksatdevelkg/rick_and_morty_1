import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';

import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/main/presentation/provider/theme_provider.dart';

class SearchCharacterScreen extends StatelessWidget {
  final TextEditingController searchController;
  final ValueNotifier<bool> siFilterView;
  final CharactersBloc charactersBloc;

  const SearchCharacterScreen({
    super.key,
    required this.searchController,
    required this.siFilterView,
    required this.charactersBloc,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          charactersBloc.add(ResetCharacters());
          charactersBloc.add(FetchCharactersEvent(
              page: value.isEmpty ? 0 : null, name: searchController.text));
        },
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () => siFilterView.value = !siFilterView.value,
            child: const Icon(Icons.filter_alt_outlined,
                color: AppColors.darkSecondaryText),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.darkSecondaryText,
          ),
          hintText: 'Find character',
          hintStyle: AppTextStyle.s14w500!
              .copyWith(color: AppColors.darkSecondaryText),
          labelText: null,
          filled: true,
          fillColor: themeProvider.currentThemeValue == AppThemeMode.dark
              ? AppColors.secondaryDart
              : AppColors.dartMainLine,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
