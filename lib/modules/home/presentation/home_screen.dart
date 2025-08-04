import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/enum/data_source_type.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/core/pagination/pagination_scroll_controller.dart';
import 'package:rick_and_morty_1/main.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';
import 'package:rick_and_morty_1/modules/home/presentation/widgets/character_home_screen.dart';
import 'package:rick_and_morty_1/modules/home/presentation/widgets/filter_character_screen.dart';
import 'package:rick_and_morty_1/modules/home/presentation/widgets/search_character_screen.dart';

@RoutePage()
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PaginationScrollController paginationScrollController =
      PaginationScrollController();
  final _siFilterView = ValueNotifier<bool>(false);
  final _charactersBloc = di<CharactersBloc>();
  final _searchController = TextEditingController();
  final _status = ValueNotifier<String?>(null);
  final _gender = ValueNotifier<String?>(null);
  final ValueNotifier<int> _maxPages = ValueNotifier<int>(1);
  final ValueNotifier<String?> _sortOrder = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();

    paginationScrollController.init(
        initAction: () => _charactersBloc.add(FetchCharactersEvent(page: 0)),
        loadAction: () {
          if (paginationScrollController.currentPage <= _maxPages.value) {
            _charactersBloc.add(
              FetchCharactersEvent(
                page: paginationScrollController.currentPage,
                name: _searchController.text,
                status: _status.value,
                gender: _gender.value,
                sortOrder: _sortOrder.value,
              ),
            );
          }

          
        });
  }

  void _resetAndFetch() {
    _charactersBloc.add(ResetCharacters());
    paginationScrollController.resetPage();
    _charactersBloc.add(FetchCharactersEvent(
      page: 0,
      name: _searchController.text,
      status: _status.value,
      gender: _gender.value,
      sortOrder: _sortOrder.value,
    ));
  }

  @override
  void dispose() {
    paginationScrollController.dispose();
    _searchController.dispose();
    _maxPages.dispose();
    _siFilterView.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _charactersBloc,
      child: BlocListener<CharactersBloc, CharactersState>(
        listener: (context, state) {
          print('👂 Listener: ${state.stutus}');
          if (state.stutus == StateStatus.init) {
            print('🚀 Dispatching FetchCharactersEvent');
            paginationScrollController.resetPage();
            _charactersBloc.add(FetchCharactersEvent(
              page: 0,
              name: _searchController.text,
              status: _status.value,
              gender: _gender.value,
              sortOrder: _sortOrder.value,
            ));

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Источник: ${state.dataSource.label}')),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                return Text('Источник: ${state.dataSource.label}');
              },
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _charactersBloc.add(ToggleDataSourceEvent());
            },
            child: const Icon(Icons.sync),
          ),
          body: Column(children: [
            const SizedBox(
              height: 50,
            ),
            SearchCharacterScreen(
                searchController: _searchController,
                siFilterView: _siFilterView,
                charactersBloc: _charactersBloc),
            FilterCharacterScreen(
              gender: _gender,
              status: _status,
              showFilter: _siFilterView,
              charactersBloc: _charactersBloc,
              onFilterChanged: _resetAndFetch,
              sortOrder: _sortOrder,
            ),
            Expanded(
              child: ValueListenableBuilder<int>(
                valueListenable: _maxPages,
                builder: (context, maxPages, child) {
                  return CharacterHomeScreen(
                    charactersBloc: _charactersBloc,
                    paginationScrollController: paginationScrollController,
                    updateMaxPages: _maxPages,
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
