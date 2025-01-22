import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_1/core/enum/state_status.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_event.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
 final FetchAllCharactersUsecase _fetchAllCharactersUsecase;
  CharactersBloc({required FetchAllCharactersUsecase fetchAllCharactersUsecase} )
      : _fetchAllCharactersUsecase = fetchAllCharactersUsecase,
       super(CharactersState(
          stutus: StateStatus.init,
        )) {
          on <FetchCharactersEvent>((event, emit) async{
            emit (CharactersState(stutus: StateStatus.loading));
            try {
           final result = await _fetchAllCharactersUsecase.execute(
            FetchAllCharactersParams()
           );

           emit(CharactersState(stutus: StateStatus.success, characters: result));

            } catch (e) {
             emit (CharactersState(stutus: StateStatus.error));
            }
          },);
        }
}
