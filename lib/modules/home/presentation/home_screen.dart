import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/config/app_router.gr.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/core/text_style/app_text_style.dart';
import 'package:rick_and_morty_1/core/theme/app_colors.dart';
import 'package:rick_and_morty_1/main.dart';
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart'; 
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';

@RoutePage()
class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  final _charactersBloc = di<CharactersBloc>()..add(FetchCharactersEvent());
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _charactersBloc,
      child: BlocBuilder<CharactersBloc, CharactersState>(
          builder: (context, state) {
        if (state.stutus == StateStatus.success) {
          return ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(
                    height: 30,
                  ),
              itemCount: state.characters?.results.length ?? 0,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    context.router.push(CharacterDelailsRoute(character: state.characters?.results[index] ?? CharacterEntity(id: 1, name: '', status: '', species: '', type: '', gender: '', image: '') ));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 74,
                        width: 74,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    state.characters?.results[index].image ??
                                        ''))),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(state.characters?.results[index].status ?? '',
                              style: AppTextStyle.s10w500!.copyWith(
                                  color: (state.characters?.results[index]
                                                  .status ??
                                              '') ==
                                          'Dead'
                                      ? Colors.red
                                      : Colors.green)),
                          Text(state.characters?.results[index].name ?? '',
                              style: AppTextStyle.s16w500),
                          Row(
                            children: [
                              Text(
                                state.characters?.results[index].species ?? '',
                                style: AppTextStyle.s12w400?.copyWith(
                                    color: AppColors.textInCharacters),
                              ),
                              Text(
                                ', ',
                                style: TextStyle(
                                    color: AppColors.textInCharacters),
                              ),
                              Text(
                                state.characters?.results[index].gender ?? '',
                                style: AppTextStyle.s12w400!.copyWith(
                                    color: AppColors.textInCharacters),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              });
        }
        return Center(
          child: Text('No data'),
        );
      }),
    );
  }
}
