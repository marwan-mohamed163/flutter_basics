import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/ui/HomeScreen.dart';
import 'package:to_do_app/ui/home/dataBase/MyDataBase.dart';
import 'package:to_do_app/ui/home/editTodo/EditTodo.dart';
import 'package:to_do_app/ui/provider/LocalizationProvider.dart';
import 'package:to_do_app/ui/provider/ThemeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
void main() {
  initDataBase();
  runApp( MyApp());
}
class MyThemeData{
  static final primaryColor =Color.fromRGBO(93, 156, 236, 1.0);
  static var accentColor =Color.fromRGBO(223, 236, 219, 1.0);
  static var whiteColor =Color.fromRGBO(255, 255, 255, 1);
  static var blackColor =Color.fromRGBO(54, 54, 54, 1.0);
  static final lightTheme =ThemeData(
      primaryColor: MyThemeData.primaryColor,
      accentColor: MyThemeData.accentColor,
      scaffoldBackgroundColor: MyThemeData.accentColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
          MyThemeData.primaryColor
      )
  );
  static final darkTheme =ThemeData(
      primaryColor: MyThemeData.primaryColor,
      accentColor: MyThemeData.accentColor,
      scaffoldBackgroundColor: MyThemeData.blackColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
          MyThemeData.primaryColor
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>LocalizationProvider(),
      builder: (context,widget){
        return ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
          builder:(context,Widget){
            final themeProvider = Provider.of<ThemeProvider>(context);
            final localeProvider = Provider.of<LocalizationProvider>(context);
            return MaterialApp(
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: AppLocalizations.supportedLocales,
              locale: Locale(localeProvider.locale,''),
              themeMode: themeProvider.themeMode,
              theme: MyThemeData.lightTheme,
              darkTheme:MyThemeData.darkTheme,
              routes: {
                HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
                EditTodo.ROUTE_NAME:(context)=>EditTodo(),
              },
              initialRoute:HomeScreen.ROUTE_NAME ,
            );

          },

        );
      },
    );
    }
  }

