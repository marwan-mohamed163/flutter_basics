import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/provider/LocalizationProvider.dart';
import 'package:to_do_app/ui/provider/ThemeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'LocaleBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class SettingsFragment extends StatefulWidget{
  @override
  State<SettingsFragment> createState() => _SettingsFragmentState();
}

class _SettingsFragmentState extends State<SettingsFragment> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final localeProvider =Provider.of<LocalizationProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.theme,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
          color: MyThemeData.primaryColor),),
          InkWell(
            onTap: ()=>{
              showThemeBottomSheet()
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration:BoxDecoration(
                color: MyThemeData.whiteColor,
               border: Border.all(width: 1,color: MyThemeData.primaryColor),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Expanded(child:
                  themeProvider.isDarkEnable()?
                  Text(AppLocalizations.of(context)!.dark):
                  Text(AppLocalizations.of(context)!.light)
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Text(AppLocalizations.of(context)!.language,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,
              color: MyThemeData.primaryColor),),
          InkWell(
            onTap: ()=>{
              showLocaleBottomSheet()
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration:BoxDecoration(
                  color: MyThemeData.whiteColor,
                  border: Border.all(width: 1,color: MyThemeData.primaryColor),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                children: [
                  Expanded(child:
                  localeProvider.locale=='en'?
                  Text('English'):
                  Text('العربية')
                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ) ,
    );
  }

  void showThemeBottomSheet(){
    showModalBottomSheet(context: context,builder:(BuildContext){
      return ThemeBottomSheet();
    });
  }

  void showLocaleBottomSheet() {
    showModalBottomSheet(context: context, builder: (buildContext){
      return LocaleBottomSheet();
    });
  }
}