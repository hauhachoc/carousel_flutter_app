import 'package:carousel_flutter_app/ui/carousel/carousel_page.dart';
import 'package:carousel_flutter_app/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_config.dart';
import 'localization/Localization.dart';
import 'locator.dart';
import 'utils/colors.dart';

void mainCommon() {
  //SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  //SystemChrome.setEnabledSystemUIOverlays([]);
  setupLocator();
  mainDelegate();
}

void mainDelegate() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) async {
    print('setLocale()');
    _MyAppState state = context.ancestorStateOfType(TypeMatcher<_MyAppState>());

    state.setState(() {
      state.locale = newLocale;
    });
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale locale;
  bool localeLoaded = false;
  @override
  void initState() {
    super.initState();
    print('initState()');

    this._fetchLocale().then((locale) {
      setState(() {
        this.localeLoaded = true;
        this.locale = locale;
      });
    });
  }

  _fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.getString('languageCode') == null) {
      return Locale(Constants.defaultLanguage, (Constants.defaultLanguage));
    }
    return Locale(
        prefs.getString('languageCode'), prefs.getString('countryCode'));
  }

  @override
  Widget build(BuildContext context) {
    var config = AppConfig.of(context);
    FlutterStatusbarcolor.setStatusBarColor(HexColor(primaryColor));

    Map<int, Color> color = {
      50: Color.fromRGBO(0, 187, 203, .1),
      100: Color.fromRGBO(0, 187, 203, .2),
      200: Color.fromRGBO(0, 187, 203, .3),
      300: Color.fromRGBO(0, 187, 203, .4),
      400: Color.fromRGBO(0, 187, 203, .5),
      500: Color.fromRGBO(0, 187, 203, .6),
      600: Color.fromRGBO(0, 187, 203, .7),
      700: Color.fromRGBO(0, 187, 203, .8),
      800: Color.fromRGBO(0, 187, 203, .9),
      900: Color.fromRGBO(0, 187, 203, 1),
    };

    return MaterialApp(
        theme: ThemeData(
          primarySwatch:
              MaterialColor(HexColor.getColorHexFromStr(primaryColor), color),
          primaryColorBrightness: Brightness.dark,
          accentColorBrightness: Brightness.dark,
          //fontFamily: "NotoSans",
        ),
        localizationsDelegates: [
          LocalizationDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale(Constants.en, ''),
          const Locale(Constants.vi, ''),
        ],
        locale: locale,
        title: config?.appDisplayName??"demo",
        //home: HomeScreen(),
        //home: DemoTextStyle(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(
                  settings: RouteSettings(name: '/', arguments: Map()), // (1)
                  builder: (context) => CarouselPage());
          }
        }
        );
  }
}
