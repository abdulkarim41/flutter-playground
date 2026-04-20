import 'package:envied/envied.dart';
import 'package:flutter/foundation.dart';
part 'app_env.g.dart';

@Envied(path: '.env_development', name: 'DevelopmentEnv')
@Envied(path: '.env_production', name: 'ProductionEnv')
final class AppEnv {
  factory AppEnv() => _instance;

  static final AppEnv _instance = switch (kDebugMode) {
    true => _DevelopmentEnv(),
    false => _ProductionEnv(),
  };

  @EnviedField(varName: 'API_BASE_URL', obfuscate: false)
  final String apiBaseUrl = _instance.apiBaseUrl;
}
