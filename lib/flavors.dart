enum Flavor {
  dev,
  device_preview,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Skeleton Dev';
      case Flavor.device_preview:
        return 'Skeleton DevPreview';
      case Flavor.stg:
        return 'Skeleton Stg';
      case Flavor.prod:
        return 'Skeleton';
      default:
        return 'title';
    }
  }

}
