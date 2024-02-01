import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:skeleton_app/i18n/strings.g.dart';
import 'package:skeleton_app/pages/home/home.ui.dart';
import 'package:skeleton_app/pages/settings/settings.ui.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  ///Stays in splash screen as long as the app builds
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  ///Sets language according to the device settings if language format is available
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    ///Removes Splash screen after build is completed
    FlutterNativeSplash.remove();
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      locale: TranslationProvider.of(context).flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
