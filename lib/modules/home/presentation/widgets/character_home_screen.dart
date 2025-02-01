import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/config/app_router.gr.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/core/pagination/pagination_scroll_controller.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';

class CharacterHomeScreen extends StatefulWidget {
  final CharactersBloc charactersBloc;
  final PaginationScrollController paginationScrollController;
  final ValueNotifier<int> updateMaxPages;

  const CharacterHomeScreen({
    super.key,
    required this.charactersBloc,
    required this.paginationScrollController,
    required this.updateMaxPages,
  });

  @override
  _CharacterHomeScreenState createState() => _CharacterHomeScreenState();
}

class _CharacterHomeScreenState extends State<CharacterHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
      builder: (context, state) {
        if (state.stutus == StateStatus.success) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            widget.updateMaxPages.value = (state.characters?.pages ?? 1);
          });

          widget.paginationScrollController.scrollController.addListener(() {
            if (widget.paginationScrollController.scrollController.position
                        .pixels ==
                    widget.paginationScrollController.scrollController.position
                        .maxScrollExtent &&
                widget.paginationScrollController.currentPage <
                    widget.updateMaxPages.value) {
              widget.charactersBloc.add(FetchCharactersEvent(
                page: widget.paginationScrollController.currentPage + 1,
                name: null,
              ));
            }
          });

          return Column(
            children: [
              Text('All characters: ${state.characters?.count ?? 0}'),
              Expanded(
                child: ListView.separated(
                  controller:
                      widget.paginationScrollController.scrollController,
                  separatorBuilder: (_, __) => const SizedBox(height: 30),
                  itemCount: state.characters?.results.length ?? 0,
                  itemBuilder: (context, index) {
                    if (state.characters?.results.isEmpty ?? true) {
                      return const Center(child: Text('No characters found.'));
                    }

                    final character =
                        (state.characters?.results.isNotEmpty == true &&
                                index < (state.characters?.results.length ?? 0))
                            ? state.characters?.results[index]
                            : CharacterEntity(
                                id: 1,
                                name: '',
                                status: '',
                                species: '',
                                type: '',
                                gender: '',
                                image: '',
                              );

                    return InkWell(
                      onTap: () => context.router.push(
                        CharacterDelailsRoute(character: character),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 37,
                            backgroundImage: NetworkImage(character!.image),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                character.status,
                                style: TextStyle(
                                  color: character.status == 'Dead'
                                      ? Colors.red
                                      : Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(character.name,
                                  style: const TextStyle(fontSize: 16)),
                              Text(
                                '${character.species}, ${character.gender}',
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const Center(child: Text('No data'));
      },
    );
  }
}
