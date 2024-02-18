import 'package:go_router/go_router.dart';
import 'package:skeleton_app/constants/route.const.dart';
import 'package:skeleton_app/pages/home/home.ui.dart';
import 'package:skeleton_app/utils/go_router.utils.dart';

final homePageRoute = GoRoute(
  name: ROUTE.home_page,
  path: ROUTE.home_page,
  pageBuilder: (context, state) {
    return createRoutePage(
      state.pageKey,
      const HomePage(),
      opaque: false,
    );
  },
);
