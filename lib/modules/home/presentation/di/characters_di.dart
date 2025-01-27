import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_1/core/service/dio_settings.dart';
import 'package:rick_and_morty_1/modules/home/data/api/home_api.dart';
import 'package:rick_and_morty_1/modules/home/data/repository/home_repository.dart';
import 'package:rick_and_morty_1/modules/home/domain/usecases/fetch_all_characters_usecase.dart';
import 'package:rick_and_morty_1/modules/home/presentation/bloc/characters_bloc.dart';

class CharactersDi {
  final GetIt di;

  CharactersDi({required this.di});
  inject() {
    di.registerSingleton<HomeApi>(
      HomeApi(
        DioSetting().dio,
      ),
    );

    di.registerFactory(() {
      return FetchAllCharactersUsecase(
        repository: HomeRepository(
          homeApi: di(),
        ),
      );
    });
    di.registerFactory(
      () => CharactersBloc(
        fetchAllCharactersUsecase: di(),
      ),
    );
  }
}
