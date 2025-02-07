import 'package:flutter/material.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';

class FilterCharacterScreen extends StatelessWidget {
  final ValueNotifier<String?> status;
  final ValueNotifier<bool> showFilter;
  final CharactersBloc charactersBloc;
  final ValueNotifier<String?> gender;
  final VoidCallback onFilterChanged;
  final ValueNotifier<String?> sortOrder;

  const FilterCharacterScreen({
    super.key,
    required this.status,
    required this.showFilter,
    required this.charactersBloc,
    required this.gender,
    required this.onFilterChanged,
    required this.sortOrder,
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
                      Text(
                        'SORT',
                        style: AppTextStyle.s10w500,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'ALPHABETICALLY',
                            style: AppTextStyle.s16w400,
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          TextButton(
                            onPressed: () {
                              sortOrder.value = 'asc';
                              charactersBloc.add(FetchCharactersEvent(
                                page: 0,
                                name: null,
                                status: status.value,
                                sortOrder: 'asc',
                              ));
                            },
                            child: Icon((Icons.sort)),
                          ),
                          TextButton(
                            onPressed: () {
                              sortOrder.value = 'desc';
                              charactersBloc.add(FetchCharactersEvent(
                                page: 0,
                                name: null,
                                status: status.value,
                                sortOrder: 'desc',
                              ));
                            },
                            child: Transform.rotate(
                              angle: 3.1416,
                              child: const Icon(Icons.sort),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'STATUS',
                        style: AppTextStyle.s10w500!
                            .copyWith(color: AppColors.darkSecondaryText),
                      ),
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
                                charactersBloc.add(ResetCharacters());
                                onFilterChanged();
                                charactersBloc.add(FetchCharactersEvent(
                                  page: 0,
                                  name: null,
                                  status: status.value,
                                ));
                              }),
                          Text(
                            'Alive',
                            style: AppTextStyle.s16w400,
                          )
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
                                charactersBloc.add(ResetCharacters());
                                onFilterChanged();
                                charactersBloc.add(FetchCharactersEvent(
                                  page: 0,
                                  name: null,
                                  status: status.value,
                                ));
                              }),
                          Text('Dead', style: AppTextStyle.s16w400)
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'unknown',
                              onChanged: (value) {
                                if (status.value != 'unknown') {
                                  status.value = 'unknown';
                                } else {
                                  status.value = null;
                                }
                                charactersBloc.add(ResetCharacters());
                                onFilterChanged();
                                charactersBloc.add(FetchCharactersEvent(
                                  page: 0,
                                  name: null,
                                  status: status.value,
                                ));
                              }),
                          Text('unknown', style: AppTextStyle.s16w400)
                        ],
                      ),
                    ],
                  );
                },
              ),
              ValueListenableBuilder<String?>(
                valueListenable: gender,
                builder: (context, value, child) {
                  return Column(
                    children: [
                      Text(
                        'GENDER',
                        style: AppTextStyle.s10w500!
                            .copyWith(color: AppColors.darkSecondaryText),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'Male',
                              onChanged: (value) {
                                if (gender.value != 'Male') {
                                  gender.value = 'Male';
                                } else {
                                  gender.value = null;
                                }
                                charactersBloc.add(ResetCharacters());
                                charactersBloc.add(
                                  FetchCharactersEvent(
                                    page: 0,
                                    name: null,
                                    gender: gender.value,
                                  ),
                                );
                              }),
                          Text('Male', style: AppTextStyle.s16w400)
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'Female',
                              onChanged: (value) {
                                if (gender.value != 'Female') {
                                  gender.value = 'Female';
                                } else {
                                  gender.value = null;
                                }
                                charactersBloc.add(ResetCharacters());
                                charactersBloc.add(
                                  FetchCharactersEvent(
                                    page: 0,
                                    name: null,
                                    gender: gender.value,
                                  ),
                                );
                              }),
                          Text('Female', style: AppTextStyle.s16w400)
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: value == 'unknown',
                              onChanged: (value) {
                                if (gender.value != 'unknown') {
                                  gender.value = 'unknown';
                                } else {
                                  gender.value = null;
                                }
                                charactersBloc.add(ResetCharacters());
                                charactersBloc.add(
                                  FetchCharactersEvent(
                                    page: 0,
                                    name: null,
                                    gender: gender.value,
                                  ),
                                );
                              }),
                          Text('unknown', style: AppTextStyle.s16w400)
                        ],
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
