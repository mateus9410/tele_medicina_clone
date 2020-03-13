import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sigamed_tele_medicina/model/database/app_database.dart';
import 'package:sigamed_tele_medicina/screens/login_screen/login_screen.dart';
import 'package:sigamed_tele_medicina/utilities/constants.dart';
import 'package:sigamed_tele_medicina/utilities/routes.dart';

AppDatabase database;
void main() {
  database = AppDatabase();
  Routes.createRoutes();
  runApp(TeleMedicina());
}

class TeleMedicina extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildThemeData(context),
      //Localization for the whole App
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale('pt'),
      ],
      //Routes
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
      initialRoute: LoginScreen.id,

      home: LoginScreen(),
    );
  }

  ThemeData _buildThemeData(BuildContext context) {
    return ThemeData(
      //Font
      fontFamily: 'HelveticaNeue',
    ).copyWith(
      //Colors
      primaryColor: kSigaMed,
      textSelectionColor: kHighlightSigaMed,
      highlightColor: kHighlightSigaMed,
      accentColor: kSigaMed,
      indicatorColor: kSigaMed,
      dividerColor: kSigaMed,
      textSelectionHandleColor: kSigaMed,
      cursorColor: kSigaMed,
      hintColor: kBlack26,
      disabledColor: kBlack26,

      //Themes
      iconTheme: IconThemeData(color: kSigaMed),
      primaryIconTheme: IconThemeData(color: kSigaMed),
      buttonBarTheme:
          ButtonBarThemeData(buttonTextTheme: ButtonTextTheme.normal),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: kSigaMed),
    );
  }
}
