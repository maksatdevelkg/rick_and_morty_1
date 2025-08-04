
import 'package:auto_route/auto_route.dart';
import 'package:rick_and_morty_1/core/config/app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MainRoute.page,
          initial: true,
        ),

        AutoRoute(
      page: ProfileDetailsRoute.page
      
    ),
    AutoRoute(
      page: CharacterDelailsRoute.page
    ),
    
    
      ];
}
