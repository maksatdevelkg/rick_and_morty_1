import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/config/app_router.gr.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/core/pagination/pagination_scroll_controller.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
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
  bool _isGrid = false;

  @override
void initState() {
  super.initState();

  widget.charactersBloc.add(FetchCharactersEvent(
    page: 0,
    name: null,
    useGraphQL: true, 
  ));

  
}


  @override
  Widget build(BuildContext context) {
    return BlocListener<CharactersBloc, CharactersState>(
      
      listener: (context, state) {
        print('🔍 BlocListener triggered: ${state.stutus}');
          if (state.stutus == StateStatus.init) {
            context.read<CharactersBloc>().add(FetchCharactersEvent(page: 0));
          }
        },
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          print('🧩 BlocBuilder triggered');
      print('🧩 state.status: ${state.stutus}');
      print('🧩 state.characters: ${state.characters}');
      print('🧩 state.characters?.results: ${state.characters?.results}');
      
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
      
          if (state.stutus == StateStatus.loading || state.stutus == StateStatus.init) {
        return const Center(child: CircularProgressIndicator());
      }
      
      
      
          if (state.stutus == StateStatus.success) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              widget.updateMaxPages.value = (state.characters?.pages ?? 1);
            }
            
            
            );
      
           
      
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                children: [
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Text(
                            'All characters: ${state.characters?.count ?? 0}',
                            style: AppTextStyle.s14w500!
                                .copyWith(color: AppColors.textInCharacters),
                          ),
                          SizedBox(
                            width: 180,
                          ),
                          IconButton(
                            icon: Icon(_isGrid ? Icons.list : Icons.grid_view),
                            onPressed: () {
                              setState(() {
                                _isGrid = !_isGrid;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: _isGrid
                        ? GridView.builder(
                            controller: widget
                                .paginationScrollController.scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.8,
                            ),
                            itemCount: state.characters?.results.length ?? 0,
                            itemBuilder: (context, index) {
                              if (index >=
                                  (state.characters?.results.length ?? 0)) {
                                return const SizedBox.shrink();
                              }
                              return _buildCharacterItem(
                                  state.characters?.results[index],
                                  isGrid: true);
                            },
                          )
                        : ListView.separated(
                            controller: widget
                                .paginationScrollController.scrollController,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 30),
                            itemCount: state.characters?.results.length ?? 0,
                            itemBuilder: (context, index) {
                              if (index >=
                                  (state.characters?.results.length ?? 0)) {
                                return const SizedBox.shrink();
                              }
                              return _buildCharacterItem(
                                  state.characters?.results[index],
                                  isGrid: false);
                            },
                          ),
                  ),
                ],
              ),
            );
          }
      
          return const Center(child: Text('No data'));
        },
      ),
    );
  }

  Widget _buildCharacterItem(CharacterEntity? character,
      {required bool isGrid}) {
    if (character == null) {
      return const Center(child: Text('No characters found.'));
    }

    return InkWell(
      onTap: () =>
          context.router.push(CharacterDelailsRoute(character: character)),
      child: isGrid
          ? Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(character.image),
                ),
                const SizedBox(height: 10),
                Text(
                  character.status,
                  style: TextStyle(
                    color:
                        character.status == 'Dead' ? Colors.red : Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  character.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${character.species}, ${character.gender}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            )
          : Row(
              children: [
                CircleAvatar(
                  radius: 37,
                  backgroundImage: NetworkImage(character.image),
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
                    Text(
                      character.name,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${character.species}, ${character.gender}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
