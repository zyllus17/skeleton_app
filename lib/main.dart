import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:skeleton_app/constants/appKey.const.dart';
import 'package:skeleton_app/i18n/strings.g.dart';
import 'package:skeleton_app/utils/go_router.utils.dart';
import 'package:skeleton_app/utils/main_file.utils.dart';

Future<void> main() async {
  final ref = ProviderContainer();
  await initializeApp(ref);

  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: const App(),
      ),
    ),
  );
}

class App extends HookConsumerWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
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
                    start: 1921,
                    end: double.infinity,
                    name: '4K',
                  ),
                ],
              )
            : const SizedBox();
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
