import 'package:flutter/material.dart';
import 'package:to_do_app/ui/HomeScreen.dart';
import 'package:to_do_app/ui/home/dataBase/MyDataBase.dart';


void main() {
  initDataBase();
  runApp( MyApp());
}
class MyThemeData{
  static final primaryColor =Color.fromRGBO(93, 156, 236, 1.0);
  static var accentColor =Color.fromRGBO(223, 236, 219, 1.0);
  static var whiteColor =Color.fromRGBO(255, 255, 255, 1);
  static var blackColor =Color.fromRGBO(54, 54, 54, 1.0);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyThemeData.primaryColor,
        accentColor: MyThemeData.accentColor,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
            MyThemeData.primaryColor
        )
      ),
      routes: {
        HomeScreen.ROUTE_NAME:(context)=>HomeScreen(),
      },
      initialRoute:HomeScreen.ROUTE_NAME ,
    );

  }
}
