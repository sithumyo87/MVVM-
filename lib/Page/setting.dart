import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:inter/provider/localeProvider.dart';
import 'package:inter/provider/themeProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Setting")),
      body: Column(
        
        children: [
          Text(AppLocalizations.of(context)!.text),
          Text(AppLocalizations.of(context)!.helloWorld),
          Switch(
            value: context.watch<ThemeProvider>().isDark,
            onChanged: (value) {
              print(value);
            if(value){
              context.read<ThemeProvider>().setDarkTheme();
            }else{
              context.read<ThemeProvider>().setLightTheme();
            }
          }),
          Switch(
            value: context.watch<LocaleProvider>().isMya,
            onChanged: (value) {
              print(value);
            if(value){
              context.read<LocaleProvider>().setMyanmar();
            }else{
              context.read<LocaleProvider>().setEnglish();
            }
          }),
        ],
      )
    );
  }
}