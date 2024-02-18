import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeleton_app/constants/appKey.const.dart';

import 'package:skeleton_app/flavors.dart';
import 'package:skeleton_app/i18n/strings.g.dart';
import 'package:skeleton_app/utils/go_router.utils.dart';
import 'package:skeleton_app/utils/main_file.utils.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///Stays in splash screen as long as the app builds
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Flavor of the app
  flavor = Flavor.dev;

  ///Provides ref
  final ref = ProviderContainer();

  /// Initialize important stuff before starting app
  await initializeApp(ref);

  runApp(
    UncontrolledProviderScope(
      container: ref,
      child: TranslationProvider(
        child: const AppDEV(),
      ),
    ),
  );
}

class AppDEV extends HookConsumerWidget {
  const AppDEV({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    useEffect(
      () {
        FlutterNativeSplash.remove();
        WidgetsBinding.instance.addPostFrameCallback(
          (timeStamp) async {},
        );
        return null;
      },
      const [],
    );

    return MaterialApp.router(
      title: AppKeys.appName,
      builder: (context, child) {
        return child != null
            ? ResponsiveBreakpoints.builder(
                child: child,
                breakpoints: [
                  const Breakpoint(start: 0, end: 480, name: MOBILE),
                  const Breakpoint(start: 481, end: 800, name: TABLET),
                  const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                  const Breakpoint(
                      start: 1921, end: double.infinity, name: '4K'),
                ],
              )
            : Container();
      },
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
