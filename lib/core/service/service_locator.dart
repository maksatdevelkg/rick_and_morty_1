import 'package:get_it/get_it.dart';

import 'package:rick_and_morty_1/modules/home/data/repository/grahpql_repository.dart';
import 'package:rick_and_morty_1/modules/home/presentation/di/characters_di.dart';

void setup(GetIt di) {
  CharactersDi(di: di).inject();

  



}