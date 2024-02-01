import 'package:flutter/material.dart';
import 'package:skeleton_app/i18n/strings.g.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool languageChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('SettingsScreen'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Text(
              t.language,
              style: const TextStyle(fontSize: 18),
            ),
            trailing: Switch(
                value: TranslationProvider.of(context).locale == AppLocale.es,
                onChanged: (languageSwitched) {
                  final newLocale =
                      languageSwitched ? AppLocale.es : AppLocale.en;
                  LocaleSettings.setLocale(newLocale);
                  // setState(() {
                  //   languageSwitched = languageSwitched;
                  // });
                }),
          )
        ],
      ),
    );
  }
}
