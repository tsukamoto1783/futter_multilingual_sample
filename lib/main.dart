import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      // locale: const Locale('zh'), // ここで設定されたロケールに基づいて表示が変わります
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'),
      //   Locale('zh'),
      //   Locale('ja'),
      // ],

      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: const [
      //   Locale('en'), // English
      //   Locale('ja'), // Spanish
      //   Locale('zh'), // Chinese
      // ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final languageSetting = _getCurrentLanguageSetting(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("multi language sample"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('システム言語設定: $languageSetting'),
            const SizedBox(height: 40),
            Text(
              "text: ${AppLocalizations.of(context)!.text}",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),

            CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
              onDateChanged: (value) {},
            ),

            // Localizations.override(
            //   context: context,
            //   locale: const Locale('es'),
            //   child: Builder(
            //     builder: (context) {
            //       return CalendarDatePicker(
            //         initialDate: DateTime.now(),
            //         firstDate: DateTime(1900),
            //         lastDate: DateTime(2100),
            //         onDateChanged: (value) {},
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

/// 現在の言語設定を取得する
String _getCurrentLanguageSetting(BuildContext context) {
  Locale locale = Localizations.localeOf(context);
  String languageCode = locale.languageCode;
  return languageCode;
}
