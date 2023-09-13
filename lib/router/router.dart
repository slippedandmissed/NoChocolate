import 'package:auto_route/auto_route.dart';
import 'package:no_chocolate/views/home.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: "/",
          page: HomeRoute.page,
        ),
      ];
}
