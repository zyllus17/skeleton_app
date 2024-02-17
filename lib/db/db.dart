import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'db.g.dart';

final dbProvider = Provider((ref) => DB());

Future<void> openHiveBox() async {
  await Hive.openBox(DB.boxName);
  // await Hive.openBox<ThemeModes>(DB.boxName);
}

class DB {
  static const boxName = 'skeleton';
  static const languageSelected = 'languageSelected';
  // static const theme = 'theme';

  bool getLanguageSelected() {
    final bool getLanguageSelected =
        (Hive.box(DB.boxName).get(DB.languageSelected) ?? false) as bool;
    return getLanguageSelected;
  }

  // ThemeModes? getThemeMode() {
  //   return Hive.box(DB.boxName).get(
  //     DB.theme,
  //     defaultValue: ThemeMode.light,
  //   ) as ThemeModes?;
  // }

  void saveLanguageSelected({required bool languageSelected}) {
    final box = Hive.box(DB.boxName);
    box.put(DB.languageSelected, languageSelected);
  }

  // void saveThemeMode(ThemeModes mode) {
  //   final box = Hive.box(DB.boxName);
  //   box.put(DB.theme, mode);
  // }

  Future<void> removeAllData() async {
    final box = Hive.box(DB.boxName);
    final _ = await box.clear();
  }
}

@HiveType(typeId: 1)
enum ThemeModes {
  @HiveField(0)
  system,
  @HiveField(1)
  light,
  @HiveField(2)
  dark,
}
