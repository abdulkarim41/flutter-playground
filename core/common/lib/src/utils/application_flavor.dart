final class ApplicationFlavor {
  static ApplicationFlavor? _instance;
  final ApplicationFlavorType flavor;

  ApplicationFlavor._(this.flavor);

  static void init(ApplicationFlavorType flavor) {
    if (_instance != null) {
      throw Exception("Flavor is already initialized.");
    }
    _instance = ApplicationFlavor._(flavor);
  }

  static ApplicationFlavor get instance {
    if (_instance == null) {
      throw Exception(
        "AppConfig not initialized. Call AppConfig.init() in main().",
      );
    }

    return _instance!;
  }
}

enum ApplicationFlavorType { development, production }

extension ApplicationFlavorTypeEx on ApplicationFlavorType {
  bool get isDevelopment => this == ApplicationFlavorType.development;
  bool get isProduction => this == ApplicationFlavorType.production;
}
