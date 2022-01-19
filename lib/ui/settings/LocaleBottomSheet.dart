import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/main.dart';
import 'package:to_do_app/ui/provider/LocalizationProvider.dart';
import 'package:to_do_app/ui/provider/ThemeProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LocaleBottomSheet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocalizationProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      child:Column(
        children: [
          InkWell(
            onTap: (){
              if(localeProvider.locale!='en')
                localeProvider.changeLocale('en');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:getRow('English',localeProvider.locale=='en')
            ),
          ),
          InkWell(
            onTap: (){
              if(localeProvider.locale!='ar')
                localeProvider.changeLocale('ar');
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:getRow('العربية', localeProvider.locale=='ar'),
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