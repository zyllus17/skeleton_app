# skeleton_app

Skeleton app for Flutter with prebuilt common features which are required in every app like splash screen, app logo, dark mode, multi-language etc.

Follow TODOs to get all the features started in a few minutes.

# Features

✓ Splash Screen

✓ Linting

✓ Workspace Settings

✓ Multi-language support

✓ FVM

✓ Flavor

✓ App Icon

✗ Light/Dark Theme Mode

✗ Local Storage(HIVE)

✗ Device Preview

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

4.  Use the String as `t.hello` in Flutter.

If you have a String where the value can be dynamic, then use `${value}`
For eg if the String needs to be `You earned 10 points` where the 10 can be any number then write the key value pair as `"you_earned_points":"You earned ${value} points"` in i18n.json file and in Flutter you will write
`Text(t.you_earned_points(value: '10'))`

## FVM - Flutter Version Manager

- Helps in managing multiple Flutter SDK for old projects and moving them to the latest package updates

1. Check the [installation process here](https://fvm.app/docs/getting_started/installation)

2. Check if fvm installed successfully by running `fvm --version`. You will see a version no. like `2.4.1`

3. Install the Flutter SDK you want to move to by running fvm install followed by version number.

   For eg if you want Flutter SDK 3.16.2 type in terminal `fvm install 3.16.2`

4. After installing the SDK, you can check all the available SDK by running `fvm list`.

5. Choose the one you want to run and type fvm use version no.

   For eg if you want to use 3.7.3 then type in terminal `fvm use 3.7.3`
