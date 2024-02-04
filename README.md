# skeleton_app

Skeleton app for Flutter with prebuilt common features which are required in every app like splash screen, app logo, dark mode, multi-language etc.

Follow TODOs to get all the features started in a few minutes.

# Features

✓ Splash Screen

✓ Linting

✓ Workspace Settings

✓ Multi-language support

✗ App Icon

✗ Light/Dark Theme Mode

✗ Flavour

✗ FVM

## Splash Screen

- Created using [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) package.

1. To change splash screen image, just follow #TODO1(Replace splash.png in assets folder with your splash image).
2. Then run this command in terminal- `dart run flutter_native_splash:create`

## Linting

- Change linting rules from [analysis_options.yaml](analysis_options.yaml) file

## Workspace Settings

- Change Workspace settings from [settings.json](.vscode/settings.json)

## Multi-language support

- Created using [slang](https://pub.dev/packages/slang) package.

1.  Create file for language that you want in [i18n folder](lib/i18n/) with the name strings\_(languageCode).i18n.json.

    For eg if you want Spanish language which has language code of `es`. The file name will be [strings_es.i18n.json](lib/i18n/strings.i18n.json).

2.  Add the text that you want in the app. Make sure that there should always be same and equal key in both files. If you miss any, it will throw an error. So while adding make sure you add it in the other file as well.

    For eg if you add {"hello":"Hello"} in strings.i18n.json,you must add {"hello":"Hola"} in strings_es.i18n.json as well. ["hello" key being the important factor]

3.  After adding the file make sure to save the file and then run `dart run slang` in the terminal for the changes to take place.
