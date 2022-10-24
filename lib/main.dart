import 'package:flutter/material.dart';
import 'package:inter/Page/flash.dart';
import 'package:inter/Page/page_one.dart';
import 'package:inter/provider/countProvider.dart';
import 'package:inter/provider/localeProvider.dart';
import 'package:inter/provider/themeProvider.dart';
import 'package:inter/provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'generated/l10n.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => CountProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => LocaleProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Intermediate',
      locale: context.watch<LocaleProvider>().locale,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('my', ''), // Myanmar, no country code
      ],
      theme: context.watch<ThemeProvider>().theme,
      home: Flash(),
    );
  }
}
