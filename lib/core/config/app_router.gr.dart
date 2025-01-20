// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:rick_and_morty_1/modules/home/presentation/home_screen.dart'
    as _i1;
import 'package:rick_and_morty_1/modules/home/settings/widgets/profile_details.dart'
    as _i3;
import 'package:rick_and_morty_1/modules/main/presentation/main_screen.dart'
    as _i2;

/// generated route for
/// [_i1.HomeBody]
class HomeBody extends _i4.PageRouteInfo<void> {
  const HomeBody({List<_i4.PageRouteInfo>? children})
      : super(
          HomeBody.name,
          initialChildren: children,
        );

  static const String name = 'HomeBody';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeBody();
    },
  );
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i4.PageRouteInfo<MainRouteArgs> {
  MainRoute({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          MainRoute.name,
          args: MainRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<MainRouteArgs>(orElse: () => const MainRouteArgs());
      return _i2.MainScreen(key: args.key);
    },
  );
}

class MainRouteArgs {
  const MainRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'MainRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.ProfileDetailsScreen]
class ProfileDetailsRoute extends _i4.PageRouteInfo<void> {
  const ProfileDetailsRoute({List<_i4.PageRouteInfo>? children})
      : super(
          ProfileDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileDetailsRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.ProfileDetailsScreen();
    },
  );
}
