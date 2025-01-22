import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/main.dart';
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
              separatorBuilder: (context, index) => SizedBox(
                    height: 30,
                  ),
              itemCount: state.characters?.results.length ?? 0,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  state.characters?.results[index].image ??
                                      ''))),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(state.characters?.results[index].status ?? '',
                            style: TextStyle(
                                color:
                                    (state.characters?.results[index].status ??
                                                '') ==
                                            'Dead'
                                        ? Colors.red
                                        : Colors.green)),
                        Text(state.characters?.results[index].name ?? ''),
                        Text(state.characters?.results[index].species ?? '')
                      ],
                    )
                  ],
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
