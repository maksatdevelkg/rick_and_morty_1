// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:rick_and_morty_1/modules/character_details/character_delails_screen.dart'
    as _i1;
import 'package:rick_and_morty_1/modules/home/domain/entity/charater_entity.dart'
    as _i7;
import 'package:rick_and_morty_1/modules/home/presentation/home_screen.dart'
    as _i2;
import 'package:rick_and_morty_1/modules/home/settings/widgets/profile_details.dart'
    as _i4;
import 'package:rick_and_morty_1/modules/main/presentation/main_screen.dart'
    as _i3;

/// generated route for
/// [_i1.CharacterDelailsScreen]
class CharacterDelailsRoute
    extends _i5.PageRouteInfo<CharacterDelailsRouteArgs> {
  CharacterDelailsRoute({
    _i6.Key? key,
    required _i7.CharacterEntity character,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          CharacterDelailsRoute.name,
          args: CharacterDelailsRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterDelailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDelailsRouteArgs>();
      return _i1.CharacterDelailsScreen(
        key: args.key,
        character: args.character,
      );
    },
  );
}

class CharacterDelailsRouteArgs {
  const CharacterDelailsRouteArgs({
    this.key,
    required this.character,
  });

  final _i6.Key? key;

  final _i7.CharacterEntity character;

  @override
  String toString() {
    return 'CharacterDelailsRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i2.HomeBody]
class HomeBody extends _i5.PageRouteInfo<void> {
  const HomeBody({List<_i5.PageRouteInfo>? children})
      : super(
          HomeBody.name,
          initialChildren: children,
        );

  static const String name = 'HomeBody';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeBody();
    },
  );
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i5.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i6.Key? key,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i3.MainScreen(key: args.key);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.ProfileDetailsScreen]
class ProfileDetailsRoute extends _i5.PageRouteInfo<void> {
  const ProfileDetailsRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ProfileDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailsRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.ProfileDetailsScreen();
    },
  );
}
