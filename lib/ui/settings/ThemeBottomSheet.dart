import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/provider/ThemeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ThemeBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child:Column(
        children: [
          InkWell(
            onTap: (){
              if(themeProvider.isDarkEnable())
                themeProvider.toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:getRow(AppLocalizations.of(context)!.light,!themeProvider.isDarkEnable())
            ),
          ),
          InkWell(
            onTap: (){
              if(!themeProvider.isDarkEnable())
                themeProvider.toggleTheme();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:getRow(AppLocalizations.of(context)!.dark, themeProvider.isDarkEnable()),
          ),
          )
        ],
      ),
    );
  }
      Widget getRow (String text,bool isSelected){
      if(isSelected){
       return  Row(
        children: [
          Expanded(child: Text(text,style: TextStyle(color:MyThemeData.primaryColor),)),
          Icon(Icons.check,color: MyThemeData.primaryColor,)
        ],
      );
    }else{
     return Row(
        children: [
          Text(text,textAlign: TextAlign.start,),
        ],
      );
    }
  }
}