import 'package:go_router/go_router.dart';
import 'package:news_app/routing/app_route';
import 'package:news_app/screens/detalis_screen.dart';
import 'package:news_app/screens/main_screen.dart';

class RouterGenration {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.mainScreen,
    routes: [
      GoRoute(
        path: AppRoutes.mainScreen,
        name: AppRoutes.mainScreen,
        builder: (context, state) => const MainScreen(),
      ),

      GoRoute(
        path: AppRoutes.detalisScreen,
        name: AppRoutes.detalisScreen,
        builder: (context, state) {
          final newsMap = state.extra;
          return DetalisScreen(newsMap: newsMap);
        },
      ),
    ],
  );
}
