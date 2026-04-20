import 'package:app_locale/src/l10n/generated/app_locale.dart';
import 'package:flutter/material.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocale get l10n => AppLocale.of(this)!;
}
