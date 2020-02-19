import 'package:carousel_flutter_app/utils/Constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'localization_strings_en.dart';
import 'localization_strings_name.dart';
import 'localization_strings_vi.dart';

class Localization {
  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    Constants.vi: vi,
    Constants.en: en
  };

  _getValue(String key) => _localizedValues[locale.languageCode][key];
  String getValueKey(String key) {
    return _localizedValues[locale.languageCode][key];
  }

  String get appTitle => _getValue(AppTitle);
  String get information => _getValue(Information);
  String get myAddressIs => _getValue(MyAddressIs);
}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      [Constants.en, Constants.vi].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}
