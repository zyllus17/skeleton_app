import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeleton_app/db/db.dart';
import 'package:skeleton_app/i18n/strings.g.dart';

Future<void> initializeApp(ProviderContainer ref) async {
  // await initHiveForFlutter();
  await Hive.initFlutter();
  await openHiveBox();
  //TODO(Maruf): Complete adding riverpod and implement language change using Riverpod
  LocaleSettings.setLocale(
    ref.read(dbProvider).getLanguageSelected() ? AppLocale.es : AppLocale.en,
  );
}
