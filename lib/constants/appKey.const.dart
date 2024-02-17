import 'package:skeleton_app/flavors.dart';

abstract class AppKeys {
  const AppKeys._();

  static String get appName {
    switch (flavor) {
      case Flavor.dev:
        return 'Skeleton Dev';
      case Flavor.device_preview:
        return 'Skeleton DevPreview';
      case Flavor.stg:
        return 'Skeleton Stg';
      case Flavor.prod:
        return 'Skeleton';
      default:
        return 'Skeleton';
    }
  }
}
