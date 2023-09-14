import 'package:auto_route/auto_route.dart';
import 'package:no_chocolate/views/home.dart';
import 'package:no_chocolate/views/game.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: "/game",
          page: GameRoute.page,
        ),
      ];
}
