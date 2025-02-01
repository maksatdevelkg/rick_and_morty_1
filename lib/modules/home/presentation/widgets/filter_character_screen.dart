import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';


class FilterCharacterScreen extends StatelessWidget {
  final ValueNotifier<String?> status;
  final ValueNotifier<bool> showFilter;
  final CharactersBloc charactersBloc;

  const FilterCharacterScreen({
    super.key,
    required this.status,
    required this.showFilter, 
    required this.charactersBloc,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showFilter,
      builder: (context, isFilterVisible, child) {
        if (isFilterVisible) {
          return Column(
            children: [
              ValueListenableBuilder<String?>(
                valueListenable: status,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'Alive',
                              onChanged: (value) {
                                if (status.value != 'Alive') {
                                  status.value = 'Alive';
                                } else {
                                  status.value = null;
                                }
                                charactersBloc.add(FetchCharactersEvent(
                                page: 0,
                                name: null,
                                status: status.value,
                              ));
                              }
                              ),
                          const Text('Alive')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'Dead',
                              onChanged: (value) {
                                if (status.value != 'Dead') {
                                  status.value = 'Dead';
                                } else {
                                  status.value = null;
                                }
                              }),
                          const Text('Dead')
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'Unknown',
                              onChanged: (value) {
                                if (status.value != 'Unknown') {
                                  status.value = 'Unknown';
                                } else {
                                  status.value = null;
                                }
                              }),
                          const Text('Unknown')
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        } else {
          return const SizedBox.shrink(); // Если фильтр не виден, ничего не показывать
        }
      },
    );
  }
}