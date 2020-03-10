import 'package:coupleutils/presentation/widget/welcome/Welcome.dart';
import 'package:coupleutils/utils/Strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WelcomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('fr', 'FR')
      ],
      title: Strings.appTitle,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Welcome(title: Strings.appTitle),
    );
  }
}
