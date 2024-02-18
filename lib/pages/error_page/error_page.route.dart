import 'package:go_router/go_router.dart';
import 'package:skeleton_app/constants/route.const.dart';
import 'package:skeleton_app/pages/error_page/error_page.ui.dart';
import 'package:skeleton_app/utils/go_router.utils.dart';

final errorPageRoute = GoRoute(
  name: ROUTE.error_page,
  path: ROUTE.error_page,
  pageBuilder: (context, state) {
    return createRoutePage(
      state.pageKey,
      const ErrorPage(),
      opaque: false,
    );
  },
);
