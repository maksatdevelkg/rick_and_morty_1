import 'package:flutter/material.dart';

import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';

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
            child: const Icon(Icons.filter_alt_outlined, color: Colors.grey),
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.grey),
          labelText: 'Find character',
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
